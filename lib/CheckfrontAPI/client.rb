require 'dotenv'
require 'net/http'
require 'net/https'
require 'yaml'
require 'json'
require 'base64'
Dotenv.load

module CheckfrontAPI
  class Client

    API_BASE_URL = ENV["API_BASE_URL"]
    API_KEY = ENV["API_KEY"]
    API_SECRET = ENV["API_SECRET"]

    def self.test_connection
      uri = URI(API_BASE_URL + 'ping')
      puts uri
      res = Net::HTTP.get_response(uri)
      res.body
    end

    def self.basic_auth
      uri = URI.parse(API_BASE_URL + 'account')
      puts uri

      Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https',
        :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

        request = Net::HTTP::Get.new uri.request_uri
        request.basic_auth API_KEY, API_SECRET

        response = http.request request # Net::HTTPResponse object
        puts 'Status: ' + JSON.parse(response.body)['request']['status']
        JSON.parse(response.body)
      end
    end

    def self.get endpoint
      uri = URI.parse(API_BASE_URL + endpoint.to_s)
      puts uri

      Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https',
        :verify_mode => OpenSSL::SSL::VERIFY_PEER) do |http|

        request = Net::HTTP::Get.new uri.request_uri
        request.basic_auth API_KEY, API_SECRET

        response = http.request request # Net::HTTPResponse object
        puts 'Status: ' + JSON.parse(response.body)['request']['status']
        JSON.parse(response.body)
        response.body
      end
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  puts JSON.pretty_generate(JSON.parse(CheckfrontAPI::Client.get('help')))
end
