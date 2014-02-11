describe "Resources API" do
  describe "GET /api/resources" do

    before(:each) do
      # create an access token to use in all tests
      @access_token = create(:user).access_token
    end

    it "denies access without token" do

      get '/api/resources'
      expect(response.status).to eq 401 # unauthorized

    end
    it "returns all the resources" do
      create :resource, title: 'resource #1'
      create :resource, title: 'resource #2'

      get '/api/resources', { access_token: @access_token }

      expect(response.status).to eq 200

    end
  end
end
