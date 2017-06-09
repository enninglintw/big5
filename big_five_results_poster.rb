class BigFiveResultsPoster
  require 'net/http'
  require 'json'

  EMAIL = "playpool513@gmail.com"
  RECRUITBOT_URL = "https://recruitbot.trikeapps.com/api/v1/roles/mid-senior-web-developer/big_five_profile_submissions"

  def initialize(hash, email = EMAIL)
    @results_hash = hash.merge({ "EMAIL" => email })
  end

  def post
    uri = URI.parse(RECRUITBOT_URL)
    request = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    request.body = @results_hash.to_json
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.request(request)
    @response_code = response.code
    @response_body = response.body
    response.class == Net::HTTPCreated ? true : false
  end

  def response_code
    @response_code
  end

  def token
    @response_code == "201" ? @response_body : nil
  end
end
