class SponsoredPostsController < ApplicationController
  before_action :set_sponsored_post, only: [:show, :edit, :update, :destroy]


  def show
    @sponsored_post = SponsoredPost.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @sponsored_post = SponsoredPost.new
  end

  def edit
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsored_post
      @sponsored_post = SponsoredPost.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sponsored_post_params
      params.require(:sponsored_post).permit(:title, :body, :price, :topic_id)
    end
end
