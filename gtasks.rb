# coding: utf-8

require 'net/http'
require 'net/https'
require 'uri'
require 'json'

email = ARGV[0]
passwd = ARGV[1]

http = Net::HTTP.new('www.google.com', 443)
http.use_ssl = true
result = http.post('/accounts/ClientLogin', 'Email=' + email + '&Passwd=' + passwd + '&source=privacylog&service=goanna_mobile')
token = result.body.gsub('Auth=', 'auth=').gsub("\n", '&')

http = Net::HTTP.new('mail.google.com', 443)
http.use_ssl = true
result = http.post('/tasks/ig', token, {'Authorization' => 'GoogleLogin'})
data = JSON.parse(result.body[/_setup\((.*)\)}<\/script>/, 1])

data['t']['tasks'].each { |task|
    if not task['completed'] then
        puts task['name']
    end
}
