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

end
