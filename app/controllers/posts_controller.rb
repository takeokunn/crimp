# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :before_action, only: [:new]

  def new; end

  def create
    @post = current_user.post.build(params.require(:post).permit(:overall_caption))
    @post.gym_id = params[:gym_id]
    if @post.save!
			redirect_to gym_path(params[:gym_id])
		else
			redirect_to root_path
		end
  end

  private

  def before_action
    @post = Post.new
    @gym = Gym.find(params[:gym_id])
  end
end
