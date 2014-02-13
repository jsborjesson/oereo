require 'spec_helper'

describe "Resources API" do
  describe "GET /api/resources" do

    before(:each) do
      @valid_auth_headers = { 'Authorization' => "Token token=\"#{ create(:developer).access_token }\"" }
    end

    it "denies access without token" do
      get '/api/resources'
      expect(response.status).to eq 401 # unauthorized
    end

    it "returns all the resources" do
      create_list(:resource, 10)

      get '/api/resources', {}, @valid_auth_headers
      expect(response).to be_success

      json = JSON.parse(response.body)
      expect(json['resources'].length).to eq(10)
    end
  end
end
