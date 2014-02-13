require 'spec_helper'

describe License do
  it { should validate_uniqueness_of(:title) }
end
