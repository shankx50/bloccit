require 'rails_helper'

RSpec.describe SponsoredPost, :type => :model do
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
  let(:price) {0}

  let(:topic) { Topic.create!(name: name, description: description) }
  let(:sponsored_post) { topic.sponsored_posts.create!(title: title, body: body, price: price) }

  it { is_expected.to belong_to(:topic) }

  describe "attributes" do
    it "has a title, body and price attribute" do
      expect(sponsored_post.title).to be == title
      expect(sponsored_post.body).to be == body
      expect(sponsored_post.price).to be == price
    end
  end

end
