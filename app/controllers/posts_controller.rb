class PostsController < ApplicationController
  def index
    @posts = Post.filter('title')
  end

  def show
  end

  def new
  end

  def edit
  end



end
