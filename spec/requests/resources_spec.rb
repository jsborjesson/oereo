describe "Resources API" do
  describe "GET /api/resources" do

    before(:each) do
      @valid_auth_headers = { 'Authorization' => "Token token=\"#{ create(:user).access_token }\"" }
    end

    it "denies access without token" do
      get '/api/resources'
      expect(response.status).to eq 401 # unauthorized
    end

    it "returns all the resources" do
      create :resource, title: 'resource #1'
      create :resource, title: 'resource #2'

      get '/api/resources', {}, @valid_auth_headers

      expect(response).to be_success

    end
  end
end
