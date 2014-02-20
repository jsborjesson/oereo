require 'spec_helper'

describe "Resources API" do

  describe "GET /api/resources" do

    # FIXME: it's REALLY slow to do this each time
    before(:each) do
      token_auth
      user_auth
    end

    it "denies access without token" do
      get '/api/resources'
      expect(response.status).to eq 401 # unauthorized
    end

    it "returns a list of resources" do
      create_list(:resource, 10)

      get '/api/resources', {}, @env
      expect(response.status).to be 200

      # TODO: jsonhelper
      expect(json['resources'].length).to eq(10)
    end


    describe "pagination" do

      xit "sends link-headers" do
        get '/api/resources', {}, @env
        # not working?
        expect(response.headers['Link']).to_not be_nil
      end

      it "sends 10 by default" do
        create_list(:resource, 15)
        get '/api/resources', {}, @env

        expect(json['resources'].length).to eq(10)
      end

      it "allows custom page lengths" do
        create_list(:resource, 15)
        get '/api/resources?per_page=5', {}, @env
        expect(json['resources'].length).to eq(5)
      end

      it "allows getting a specific page" do
        create_list(:resource, 8)

        # only 3 in the last page
        get '/api/resources?per_page=5&page=2', {}, @env
        expect(json['resources'].length).to eq(3)


      end

      it "sends an empty array if page is after the last" do
        create_list(:resource, 10)

        # pages after that should be empty
        get '/api/resources?per_page=5&page=3', {}, @env
        expect(json['resources'].length).to eq(0)
      end

    end
  end

  it "does not allow setting another user"
  it "allows editing of owned resources"
  it "does not allow editing of other's resources"
  it "creates a new resource"
  it "sets the current user on posted resources"
  it "changes a resource"
  it "deletes resources if permitted"
end
