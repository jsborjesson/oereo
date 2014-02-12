require 'spec_helper'

describe Developer do
  describe "api_key" do
    it { should have_one(:api_key) }

    it "should create an api key when developer is created" do
      developer = create(:developer)
      expect(developer.api_key).to_not be_nil
    end

    it "can regenerate the api_key" do
      developer = create(:developer)
      token = developer.access_token
      developer.renew_access_token
      expect(developer.access_token).to_not eq token
    end

    it "doesn't regenerate the api_key unless told so" do
      # make sure not accidentally renewing token before all validations
      developer = create(:developer)
      token = developer.access_token
      developer.email = 'another@email.com'
      expect(developer.access_token).to eq token
    end
  end

end
