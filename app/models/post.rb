class Post < ActiveRecord::Base
  has_many :comments

  def self.filter(field)
    spam_filter = SpamFilter.new(Post.all)
    filtered = spam_filter.filter(field)
    filtered.each do |obj|
      obj.save
    end
    filtered
  end
end
