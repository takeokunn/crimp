class GymReviewsController < ApplicationController
  def new
    @gym_review = GymReview.new(gym_id: params[:gym_id], user_id: current_user.id)
  end

	def create
		@gym_review = GymReview.create(params.require(:gym_review).permit(:problems_quality, :cost_par_fee, :comfortableness, :service))
    if @gym_review.valid?
			@gym_review.overall_score = (@gymReview.problems_quality + @gymReview.cost_par_fee + @gymReview.comfortableness + @gymReview.service) / 4
			@gym_review.user_id = current_user.id
			@gym_review.gym_id = params[:gym_id]
			@gym_review.save
			calculate_gym_ranking
			redirect_to gym_path(params[:gym_id])
		else
			redirect_to root_path
		end
  end

  def destroy; end

  def edit
    @gym_review = GymReview.find_by(gym_id: params[:gym_id], user_id: current_user.id)
  end

	def update
		@gym_review = GymReview.find_by(gym_id: params[:gym_id], user_id: current_user.id)
    if @gym_review.valid?
			@gym_review.update(params.require(:gym_review).permit(:problems_quality, :cost_par_fee, :comfortableness, :service))
			@gym_review.overall_score = (@gym_review.problems_quality + @gym_review.cost_par_fee + @gym_review.comfortableness + @gym_review.service) / 4
			@gym_review.save
			calculate_gym_ranking
			redirect_to gym_path(params[:gym_id])
		else
			redirect_to root_path
		end
  end

  private

  def calculate_gym_ranking
    @gym_reviews = GymReview.where(gym_id: params[:gym_id])
    @overall_score = @gym_reviews.average(:overall_score)
    @problems_quality = @gym_reviews.average(:problems_quality)
    @cost_par_fee = @gym_reviews.average(:cost_par_fee)
    @comfortableness = @gym_reviews.average(:comfortableness)
    @service /= @gym_reviews.average(:service)

    if OverallGymReview.find_by(gym_id: params[:gym_id])
      OverallGymReview.find_by(gym_id: params[:gym_id]).update(overall_score: @overall_score, problems_quality: @problems_quality, cost_par_fee: @cost_par_fee, comfortableness: @comfortableness, service: @service)
    else
      OverallGymReview.create(gym_id: params[:gym_id], overall_score: @overall_score, problems_quality: @problems_quality, cost_par_fee: @cost_par_fee, comfortableness: @comfortableness, service: @service)
    end
  end
end
