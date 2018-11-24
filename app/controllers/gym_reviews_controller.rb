class GymReviewsController < ApplicationController
    def new
        @gymReview = GymReview.new(gym_id: params[:gym_id], user_id: current_user.id)
    end
    def create
        @gymReview = GymReview.create(params.require(:gym_review).permit(:problems_quality, :cost_par_fee, :comfortableness, :service))
        @gymReview.overall_score = (@gymReview.problems_quality + @gymReview.cost_par_fee + @gymReview.comfortableness + @gymReview.service) / 4
        @gymReview.gym_id = params[:gym_id]
        @gymReview.user_id = current_user.id
        @gymReview.gym_id = params[:gym_id]
        @gymReview.save
        redirect_to gym_path(params[:gym_id])
    end
    def destroy
    end
    def edit
        @gymReview = GymReview.find_by(gym_id: params[:gym_id], user_id: current_user.id)
    end
    def update
        @gymReview = GymReview.find_by(gym_id: params[:gym_id], user_id: current_user.id)
        @gymReview.update(params.require(:gym_review).permit(:problems_quality, :cost_par_fee, :comfortableness, :service))
        @gymReview.overall_score = (@gymReview.problems_quality + @gymReview.cost_par_fee + @gymReview.comfortableness + @gymReview.service) / 4
        @gymReview.save
        redirect_to gym_path(params[:gym_id])
    end
end
