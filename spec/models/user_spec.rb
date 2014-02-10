require 'spec_helper'

describe User do
  it { should have_one(:api_key) }
  it { should validate_presence_of(:email) }

  it do
    create(:user) # need to create new record for this to work properly
    should validate_uniqueness_of(:email)
  end

  it { should have_secure_password }
end
