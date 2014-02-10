require 'spec_helper'

describe Tag do

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should have_and_belong_to_many(:resources) }

  it "should lower the case of inputted text" do
    tag = create(:tag, name: 'TestTag')
    expect(tag.name).to eq('testtag')
  end

  it "should have a unique name" do
    create(:tag, name: 'duplicate')
    duplicate = build(:tag, name: 'duplicate')
    expect(duplicate).not_to be_valid
  end

end
