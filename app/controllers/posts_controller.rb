class PostsController < ApplicationController
  def index
    @posts = clean_array Post.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def clean_array array
    array.each do |el|
      if (array.index(el) % 5 == 0)
        el.title = "Sanitized Post Title"
        el.save
      end
    end
  end

end
