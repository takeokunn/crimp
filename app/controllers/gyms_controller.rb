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
    calculate_problems_quality_rank
    calculate_cost_par_fee_rank
    calculate_comfortableness_rank
    calculate_service_rank
  end
  def calculate_overall_score_rank
    @overall_score_rank = 1
    @overall_gym_reviews_of_score = @overall_gym_reviews.order(overall_score: :desc)
    if @overall_gym_reviews.length >= 2
      while @overall_gym_reviews_of_score.pluck(:overall_score)[@overall_score_rank - 1] > OverallGymReview.find_by(gym_id: params[:id]).overall_score
          @overall_score_rank += 1
      end
    end
  end
  def calculate_problems_quality_rank
    @overall_problems_quality_rank = 1
    @overall_gym_reviews_of_problems_quality = @overall_gym_reviews.order(problems_quality: :desc)
    if @overall_gym_reviews.length >= 2
      while @overall_gym_reviews_of_problems_quality.pluck(:problems_quality)[@overall_problems_quality_rank - 1] > OverallGymReview.find_by(gym_id: params[:id]).problems_quality
          @overall_problems_quality_rank += 1
      end
    end
  end
  def calculate_cost_par_fee_rank
    @overall_cost_par_fee_rank = 1
    @overall_gym_reviews_of_cost_par_fee = @overall_gym_reviews.order(cost_par_fee: :desc)
    if @overall_gym_reviews.length >= 2
      while @overall_gym_reviews_of_cost_par_fee.pluck(:cost_par_fee)[@overall_cost_par_fee_rank - 1] > OverallGymReview.find_by(gym_id: params[:id]).cost_par_fee
          @overall_problems_quality_rank += 1
      end
    end
  end
  def calculate_comfortableness_rank
    @overall_comfortableness_rank = 1
    @overall_gym_reviews_of_comfortableness = @overall_gym_reviews.order(comfortableness: :desc)
    if @overall_gym_reviews.length >= 2
      while @overall_gym_reviews_of_comfortableness.pluck(:comfortableness)[@overall_comfortableness_rank - 1] > OverallGymReview.find_by(gym_id: params[:id]).comfortableness
          @overall_comfortableness_rank += 1
      end
    end
  end
  def calculate_service_rank
    @overall_service_rank = 1
    @overall_gym_reviews_of_service = @overall_gym_reviews.order(service: :desc)
    if @overall_gym_reviews.length >= 2
      while @overall_gym_reviews_of_service.pluck(:service)[@overall_service_rank - 1] > OverallGymReview.find_by(gym_id: params[:id]).service
          @overall_service_rank += 1
      end
    end
  end
end
