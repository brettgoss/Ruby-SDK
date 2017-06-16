require 'dotenv'
require 'net/http'
require 'yaml'
require 'json'
Dotenv.load

module CheckfrontAPI
  class Client

    API_ENDPOINT = ENV["API_ENDPOINT"]
    API_KEY = ENV["API_KEY"]
    API_SECRET = ENV["API_SECRET"]

    def self.test_connection
      uri = URI(API_ENDPOINT + 'ping')
      puts uri
      res = Net::HTTP.get_response(uri)
      res.body
    end

    def self.initialize

    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts JSON.pretty_generate(JSON.parse(CheckfrontAPI::Client.test_connection))
end
