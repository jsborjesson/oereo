require 'spec_helper'

describe ApiKey do
  it { should validate_uniqueness_of :access_token }
end
