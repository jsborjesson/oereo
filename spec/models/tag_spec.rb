require 'spec_helper'

describe Tag do

  it { should validate_presence_of(:tag_name) }
  it { should validate_uniqueness_of(:tag_name) }
  it { should have_and_belong_to_many(:resources) }

  it "should lower the case of inputted text" do
    tag = create(:tag, tag_name: 'TestTag')
    expect(tag.tag_name).to eq('testtag')
  end

  it "should have a unique tag_name" do
    create(:tag, tag_name: 'duplicate')
    duplicate = build(:tag, tag_name: 'duplicate')
    expect(duplicate).not_to be_valid
  end

end
