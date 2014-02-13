require 'spec_helper'

describe Developer do

  # FIXME: Move this to isolated EmailValidator spec
  describe "email" do
    it "validates invalid email addresses" do
      [
        'email',
        'email@com',
        'www.google.com',
        'http://google.com',
        'email.email@email',
        'email.com',
        'email/email@.com'
      ].each do |email|
        dev = build(:developer, email: email)
        expect(dev).to have(1).errors_on(:email)
      end
    end

    it "validates valid email addresses" do
      [
        'email@email.com',
        'abcd1234@email.com',
        'firstname.surname@email.com',
      ].each do |email|
        dev = build(:developer, email: email)
        expect(dev).to be_valid
      end
    end
  end

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
