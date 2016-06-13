class Api::V1::PostsController < Api::V1::BaseController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

# #23
  def index
    posts = Post.all
    render json: posts, status: 200
  end

# #24
  def show
    post = Post.find(params[:id])
    render json: {post: post, comments: post.comments}, status: 200
  end
end
