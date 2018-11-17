class PostsController < ApplicationController

  before_action :before_action, only: [:new]

  def new 
  end

  def create
    @post = Post.create(params.require(:post).permit(:overall_caption))
    @post.gym_id = params[:gym_id]
    @post.user_id = session[:user_id]
    redirect_to gym_path(params[:gym_id])
  end

  private
  def before_action
    @post = Post.new
    @gym = Gym.find(params[:gym_id])
  end
end
