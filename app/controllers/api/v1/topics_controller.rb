class Api::V1::TopicsController < Api::V1::BaseController

  before_action :authenticate_user, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

# #23
  def index
    topics = Topic.all
    render json: topics, status: 200
  end

# #24
  def show
    topic = Topic.find(params[:id])
    render json: {topic: topic, posts: topic.posts}, status: 200
  end
end
