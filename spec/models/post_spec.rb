require 'rails_helper'

RSpec.describe Post, :type => :model do
  let(:post) {Post.create!(title: "New Post Title", body: "New Post Body")}

  describe "attributes" do

    it "responds to title" do
      expect(post).to have_attributes(:title)
    end

    it "responds to body" do
      expect(post).to have_attributes(:body)
    end
  end
end
