require 'spec_helper'

describe User do
  it { should have_secure_password }
  it { should ensure_length_of(:password).is_at_least(5) }

  describe "email" do
    it { should validate_presence_of(:email) }

    it do
      create(:user) # need to create new record for this to work properly
      should validate_uniqueness_of(:email)
    end

    it "should validate as a proper email address"

  end


  describe "api_key" do
    it { should have_one(:api_key) }

    it "should create an api key when user is created" do
      user = create(:user)
      expect(user.api_key).to_not be_nil
    end

    it "can regenerate the api_key" do
      user = create(:user)
      token = user.access_token
      user.renew_access_token
      expect(user.access_token).to_not eq token
    end

    it "doesn't regenerate the api_key unless told so" do
      # make sure not accidentally renewing token before all validations
      user = create(:user)
      token = user.access_token
      user.email = 'another@email.com'
      expect(user.access_token).to eq token
    end
  end

end
