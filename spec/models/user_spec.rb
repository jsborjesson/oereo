require 'spec_helper'

describe User do

  describe "email" do
    it { should validate_presence_of(:email) }

    it do
      create(:user) # need to create new record for this to work properly
      should validate_uniqueness_of(:email)
    end

    it "should validate as a proper email address"

  end

  it { should have_secure_password }

  describe "api_key" do

    it { should have_one(:api_key) }

    it "should create an api key when user is created" do
      user = create(:user)
      expect(user.api_key).to_not be_nil
    end

    it "can regenerate the api_key"

    it "doesn't regenerate the api_key unless told so"
  end

end
