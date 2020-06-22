require 'net/http'
require './initialize.rb'
require './helper.rb'

def create_employee
  uri = URI.parse(BASE_URI + '/v1/crews')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Post.new(uri.path)
  req.body = set_params.to_json
  req.initialize_http_header(set_header)
  response = http.request(req)
  puts response.body
end

def delete_employee
  uri = URI.parse(BASE_URI + "/v1/crews/#{DELETE_ID}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Delete.new(uri.path)
  req.initialize_http_header(set_header)
  response = http.request(req)
end
