# frozen_string_literal: true

class GymsController < ApplicationController
	before_action :before_action, only: %i[show edit update]

	def index
		@gyms = Gym.all
  end

  def show
    @posts = Post.where(gym_id: params[:id])
    @home_gym = HomeGym.where(gym_id: params[:id])
		@gym_likes = GymLike.where(gym_id: params[:id])
		overall_gym_review
  end

  def edit; end

  def update
    @gym.update(params.require(:gym).permit(:gym_name, :place, :access))
    redirect_to gyms_path
  end

  private

	def before_action
		@gyms = Gym.all
    @gym = Gym.find(params[:id])
    @gym_reviews = GymReview.where(gym_id: params[:id])
    @overall_gym_review = OverallGymReview.find_by(gym_id: params[:id])
	end

	def overall_gym_review
		if @overall_gym_review == nil
			@overall_score = 0
			@problems_quality = 0
			@cost_par_fee = 0
			@comfortableness = 0
			@service = 0
		else
			@overall_score = @overall_gym_review.overall_score
			@problems_quality = @overall_gym_review.problems_quality
			@cost_par_fee = @overall_gym_review.cost_par_fee
			@comfortableness = @overall_gym_review.comfortableness
			@service = @overall_gym_review.service
		end
	end
end
