class GymLikesController < ApplicationController
      def create
            GymLike.create(gym_id: params[:gym_id], user_id: current_user.id)
            redirect_back(fallback_location: gym_path(params[:gym_id]))
      end
      def destroy
      	GymLike.find_by(gym_id: params[:gym_id], user_id: current_user.id).destroy
            redirect_back(fallback_location: gym_path(params[:gym_id]))
      end
end
