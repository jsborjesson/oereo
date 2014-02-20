require 'spec_helper'

describe ResourceCategory do
  it { should validate_uniqueness_of(:category) }
  it { should validate_presence_of(:category) }
end
