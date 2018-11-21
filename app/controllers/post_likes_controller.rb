class PostLikesController < ApplicationController
     def create
            PostLike.create(user_id: current_user.id, post_id: params[:post_id])
            redirect_back(fallback_location: gym_path(params[:gym_id]))
      end

      def destroy
            PostLike.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
            redirect_back(fallback_location: gym_path(params[:gym_id]))
      end
     
end
