require 'spec_helper'

# mostly stolen from railscasts #301 but updated to expectation-syntax
describe Resource do

  it { should have_and_belong_to_many(:tags) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(140) }
  it { should belong_to(:resource_category) }
  it { should belong_to(:user) }
  it { should belong_to(:license) }

  # TODO: Implement smart protocol
  xit "adds http:// to URL upon saving" do
    expect(create(:resource, url: "example.com").url).to eq("http://example.com")
    expect(create(:resource, url: "http://example.com").url).to eq("http://example.com")
  end

  it "leaves an invalid url unchanged" do
    expect(build(:resource, url: "foo bar").url).to eq("foo bar")
    expect(build(:resource, url: nil).url).to eq(nil)
  end

  it "should validate url formatting" do
    expect(build(:resource, url: 'www.google.com')).to be_invalid # needs protocol
    expect(build(:resource, url: 'not_a_url.com')).to be_invalid
    expect(build(:resource, url: 'http://google.com')).to be_valid
  end

end
