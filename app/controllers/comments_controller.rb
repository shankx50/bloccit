class CommentsController < ApplicationController
  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]
  before_action :set_commentable

  def create
    comment = Comment.new({body: comment_params[:body], user: current_user})

    if comment.save
      @commentable.comments << comment
      flash[:notice] = "Comment saved successfully."
      redirect_to @redirect_path
    else
      flash[:alert] = "Comment failed to save."
      redirect_to @redirect_path
    end
  end

  def destroy
    comment = @commentable.comments.find(params[:id])

    if comment.destroy
      flash[:notice] = "Comment was deleted successfully."
      redirect_to @redirect_path
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to @redirect_path
    end
  end

  private

  def set_commentable
    is_post = !params[:post_id].nil?
    @commentable = is_post ? Post.find(params[:post_id]) : Topic.find(params[:topic_id])
    @redirect_path = is_post ? [@commentable.topic, @commentable] : @commentable
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment."
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
