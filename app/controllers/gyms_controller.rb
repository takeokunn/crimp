class GymsController < ApplicationController
  before_action :before_action, only: %i[show edit update]
  def index
    @gym = Gym.all
  end

  def show
    @posts = Post.where(gym_id: params[:id])
    @homeGym = HomeGym.where(gym_id: params[:id])
    @gymLikes = GymLike.where(gym_id: params[:id])
    @overall_score = 0
    @problems_quality = 0
    @cost_par_fee = 0
    @comfortableness = 0
    @service = 0
    if @gymReviews.length >= 1
      @gymReviews.each do |gymReview|
        @overall_score += gymReview.overall_score
        @problems_quality += gymReview.problems_quality
        @cost_par_fee += gymReview.cost_par_fee
        @comfortableness += gymReview.comfortableness
        @service += gymReview.service
      end
      @overall_score = @overall_score / @gymReviews.length
      @problems_quality = @problems_quality / @gymReviews.length
      @cost_par_fee = @cost_par_fee / @gymReviews.length
      @comfortableness = @comfortableness / @gymReviews.length
      @service = @service / @gymReviews.length
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
  end
end
