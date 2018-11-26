class GymsController < ApplicationController
  before_action :before_action, only: %i[show edit update]
  def index
    @gym = Gym.all
  end

  def show
    @posts = Post.where(gym_id: params[:id])
    @homeGym = HomeGym.where(gym_id: params[:id])
    @gymLikes = GymLike.where(gym_id: params[:id])
    overall_gym_review
    if @overall_gym_review
      calculate_gym_rank
    end
  end

  def edit; end

  def update
    @gym.update(params.require(:gym).permit(:gym_name, :place, :access))
    redirect_to gyms_path
  end

  private

  def before_action
    @gym = Gym.find(params[:id])
    @gymReviews = GymReview.where(gym_id: params[:id])
    @gyms = Gym.all
    @overall_gym_review = OverallGymReview.find_by(gym_id: params[:id])
  end

  def overall_gym_review
    @overall_score = 0
    @problems_quality = 0
    @cost_par_fee = 0
    @comfortableness = 0
    @service = 0
    if @overall_gym_review
          @overall_score = @overall_gym_review.overall_score
          @problems_quality = @overall_gym_review.problems_quality
          @cost_par_fee = @overall_gym_review.cost_par_fee
          @comfortableness = @overall_gym_review.comfortableness
          @service = @overall_gym_review.service
    end
  end

  def calculate_gym_rank
    @overall_gym_reviews = OverallGymReview.all
    calculate_overall_score_rank
  end

  def calculate_overall_score_rank
    @i = 1
    @overall_gym_review_of_score = @overall_gym_reviews.order(overall_score: :desc)
    if @overall_gym_reviews.length >= 2
      while @overall_gym_review_of_score.pluck(:overall_score)[@i - 1] > OverallGymReview.find_by(gym_id: params[:id]).overall_score
          @i += 1
      end
    end
  end
end
