local socket = require('socket')
local http = require('socket.http')
local ltn12 = require('ltn12')
local ssl = require('ssl')
local json = require('json')

-- POST & SSL request
function request(url, param)
    local response = {}

    local config = {
        mode = 'client',
        protocol = 'sslv23',
        cafile = '/etc/ssl/certs/ca-certificates.crt',
        verify = 'peer',
        options = 'all',
    }

    function create()
        local t = {c=socket.try(socket.tcp())}

        function idx (tbl, key)
            return  function (prxy, ...)
                        local c = prxy.c
                        return c[key](c,...)
                    end
        end

        function t:connect(host, port)
            socket.try(self.c:connect(host, port))
            self.c = socket.try(ssl.wrap(self.c, config))
            socket.try(self.c:dohandshake())
            return 1
        end

        return setmetatable(t, {__index = idx})
    end

    http.request{
        url = url,
        sink = ltn12.sink.table(response),
        method = 'POST',
        headers = {
            ['Content-Length'] = string.len(param),
            ['Content-Type'] =  'application/x-www-form-urlencoded'
        },
        source = ltn12.source.string(param),
        create = create,
    }

    return table.concat(response)
end

local c_timer = 0
local result = ''

function conky_gtasks(email, passwd)
    if c_timer == 0 then

        local token = request('https://www.google.com:443/accounts/ClientLogin', 'Email=' .. email .. '&Passwd=' .. passwd .. '&source=privacylog&service=goanna_mobile')
        token = string.gsub(token, 'Auth=', 'auth=')
        token = string.gsub(token, '\n', '&')

        local data = request('https://mail.google.com:443/tasks/ig', token)
        data = string.gsub(data, '.*_setup.', '')
        data = string.gsub(data, '..<\/script>.*', '')
        data = json.decode(data)

        result = ''
        for _,task in pairs(data.t.tasks) do
            if not task.deleted then
                local status = ''
                if task.completed then
                    status = 'x'
                else
                    status = '_'
                end
                result = result .. '[' .. status .. '] ' .. task.name .. '\n'
            end
        end

    end

    c_timer = c_timer + conky_info.update_interval
    if c_timer >= 3600 then c_timer = 0 end

    return result
end
