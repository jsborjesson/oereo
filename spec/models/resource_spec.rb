require 'spec_helper'

# mostly stolen from railscasts #301 but updated to expectation-syntax
describe Resource do

  it { should validate_presence_of(:url) }
  it { should have_and_belong_to_many(:tags) }

  it "adds http:// to URL upon saving" do
    expect(Resource.create!(url: "example.com").url).to eq("http://example.com")
    expect(Resource.create!(url: "http://example.com").url).to eq("http://example.com")
  end

  it "validates URL format" do
    resource = build(:resource, url: "foo bar")
    expect(resource).not_to be_valid

    resource.url = "example.com"
    expect(resource).to be_valid
  end

  describe ".format_url" do
    it "adds http:// to a URL if not provided" do
      expect(Resource.format_url("example.com")).to eq("http://example.com")
    end

    it "does not add http:// to a URL if already provided" do
      expect(Resource.format_url("http://example.com")).to eq("http://example.com")
    end

    it "returns an invalid URL unchanged" do
      expect(Resource.format_url("foo bar")).to eq("foo bar")
      expect(Resource.format_url(nil)).to eq(nil)
    end
  end

  describe ".url_regexp" do
    it "matches valid URLs" do
      [
        'http://example.com/',
        'HTTP://E-XAMLE.COM',
        'https://example.co.uk./foo',
        'http://example.com:8080',
        'http://www.example.com/anything/after?slash',
        'http://www.example.com?anything_after=question',
        'http://user123:sEcr3t@example.com',
        'http://user123:@example.com',
        'http://example.com/~user',
        'http://1.2.3.4:8080',
        'http://ütf8.com',
      ].each do |url|
        expect(url).to match(Resource.url_regexp)
      end
    end

    it "does not match invalid URLs" do
      [
        "www.example.com",
        "http://",
        "http://example..com",
        "http://e xample.com",
        "http://example.com/foo bar",
        "http://example", # technically valid but not what we want from user
        "other://example.com", # we also don't want other protocols
      ].each do |url|
        expect(url).not_to match(Resource.url_regexp)
      end
    end
  end
end
