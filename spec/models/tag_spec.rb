require 'spec_helper'

describe Tag do

  it "must have a name" do
    empty_tag = build(:tag, name: '')
    expect(empty_tag).not_to be_valid
  end

  it "should lower the case of inputted text"

  it "should have a unique name" do
    create(:tag, name: 'duplicate')
    duplicate = build(:tag, name: 'duplicate')
    expect(duplicate).not_to be_valid
  end

end
