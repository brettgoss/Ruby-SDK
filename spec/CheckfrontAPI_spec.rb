require "spec_helper"

RSpec.describe CheckfrontAPI do
  it "has a version number" do
    expect(CheckfrontAPI::VERSION).not_to be nil
  end

  it "can reach the server" do
    expect(CheckfrontAPI::Client::test_connection).not_to be nil
  end

  it "can reach /account with basic auth" do
    expect(CheckfrontAPI::Client::get('account')).to include "OK"
  end

  it "can't reach an endpoint that doesn't exist" do
    expect(CheckfrontAPI::Client::get('this/is/not/an/endpoint')).to include "Cannot complete request"
  end

end
