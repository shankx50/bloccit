require 'rails_helper'

RSpec.describe "SponsoredPosts", :type => :request do
  describe "GET /sponsored_posts" do
    it "works! (now write some real specs)" do
      get sponsored_posts_path
      expect(response.status).to be(200)
    end
  end
end