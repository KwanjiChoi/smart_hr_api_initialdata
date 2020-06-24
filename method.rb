require 'net/http'
require 'json'
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
  res_hash = JSON.parse(response.body)
  puts "従業員 #{res_hash['last_name']}　#{res_hash['first_name']}を登録しました"
end

def delete_crew(id)
  uri = URI.parse(BASE_URI + "/v1/crews/#{id}")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  req = Net::HTTP::Delete.new(uri.path)
  req.initialize_http_header(set_header)
  response = http.request(req)
  puts '削除に成功しました' if response.code == '204'
end

def get_employee_id(query)
  uri = URI.parse(BASE_URI + "/v1/crews")
  uri.query = URI.encode_www_form({per_page: 5,q: query})
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = uri.scheme === "https"
  req = Net::HTTP::Get.new(uri.request_uri)
  req.initialize_http_header(set_header)
  response = http.request(req)
  res_hash = JSON.parse(response.body)
end
