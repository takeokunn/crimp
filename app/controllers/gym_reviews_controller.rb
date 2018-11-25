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
        calculate_gym_ranking
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
        calculate_gym_ranking
        redirect_to gym_path(params[:gym_id])
    end

    private
    def calculate_gym_ranking
        @gymReviews = GymReview.where(gym_id: params[:gym_id])
        @overall_score = 0
        @problems_quality = 0
        @cost_par_fee = 0
        @comfortableness = 0
        @service = 0
        @gymReviews.each do |gymReview|
            @overall_score += gymReview.overall_score
            @problems_quality = gymReview.problems_quality
            @cost_par_fee = gymReview.cost_par_fee
            @comfortableness = gymReview.comfortableness
            @service = gymReview.service
        end
        @overall_score = @overall_score / @gymReviews.length
        @problems_quality = @problems_quality / @gymReviews.length
        @cost_par_fee = @cost_par_fee / @gymReviews.length
        @comfortableness = @comfortableness / @gymReviews.length
        @service = @service / @gymReviews.length

        if OverallGymReview.find_by(gym_id: params[:gym_id])
            OverallGymReview.find_by(gym_id: params[:gym_id]).update(overall_score: @overall_score, problems_quality: @problems_quality, cost_par_fee: @cost_par_fee, comfortableness: @comfortableness, service:@service)
        else
            OverallGymReview.create(gym_id: params[:gym_id], overall_score: @overall_score, problems_quality: @problems_quality, cost_par_fee: @cost_par_fee, comfortableness: @comfortableness, service:@service)
        end
    end
end
