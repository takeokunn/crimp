class PostLikesController < ApplicationController
      def like
            if PostLike.find_by(user_id: current_user.id, post_id: params[:id])
                  PostLike.find_by(user_id: current_user.id, post_id: params[:id]).destroy
            else
                  PostLike.create(user_id: current_user.id, post_id: params[:id])
            end
            redirect_back(fallback_location: gym_path(params[:gym_id]))
      end
end
