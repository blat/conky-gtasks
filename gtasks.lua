c_timer = 0
result = ''

function conky_gtasks(email, passwd)
    if c_timer == 0 then
        local tmp = os.tmpname()
        local cmd = 'ruby gtasks.rb ' .. email .. ' ' .. passwd .. ' > ' .. tmp
        os.execute(cmd)
        result = ''
        file = io.open(tmp, 'r')
        for line in file:lines() do
            result = result .. "\n" .. line
        end
        file:close()
    end

    c_timer = c_timer + conky_info.update_interval
    if c_timer >= 3600 then c_timer = 0 end

    return result
end
