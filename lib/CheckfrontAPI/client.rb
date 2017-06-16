require 'net/http'
require 'yaml'

module CheckfrontAPI
  class Client
      
    config = YAML.load_file(File.expand_path(File.dirname('__FILE__') + "/config.yml"))
    API_ENDPOINT = config["config"]["api_endpoint"]
    API_KEY = config["config"]["api_key"]
    API_SECRET = config["config"]["api_secret"]

    def self.test_connection
      uri = URI(API_ENDPOINT)
      res = Net::HTTP.get_response(uri)
      res.body
    end
    
    def self.initialize
      
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts CheckfrontAPI::Client.test_connection
end