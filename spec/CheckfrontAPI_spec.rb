require "spec_helper"

RSpec.describe CheckfrontAPI do
  it "has a version number" do
    expect(CheckfrontAPI::VERSION).not_to be nil
  end

  it "can reach the server" do
    expect(CheckfrontAPI::Client::test_connection).not_to be nil
  end
  
  xit "can authenticate" do
    
  end
  
end
