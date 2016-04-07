require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

  describe "attributes" do
    it "responds to body" do
      expect(comment).to have_attributes(:body)
    end
  end
end
