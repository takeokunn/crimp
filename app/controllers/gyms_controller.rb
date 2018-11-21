class GymsController < ApplicationController
      before_action :before_action, only: [:show, :edit, :update] 
      def index
            @gym = Gym.all
            
      end

      def show
            @posts = Post.where(gym_id: params[:id])
            @gymLikes = GymLike.where(gym_id: params[:id]) 
      end

      def edit 
      end

      def update
          @gym.update(params.require(:gym).permit(:gym_name, :place, :access))
          redirect_to gyms_path
      end

      def like
            @gym = Gym.find(params[:id])
            if GymLike.exists?(gym_id: @gym.id, user_id: current_user.id)
                  GymLike.find_by(gym_id: @gym.id, user_id: current_user.id).destroy
            else
                  GymLike.create(gym_id: @gym.id, user_id: current_user.id)
            end
            redirect_to gym_path(params[:id])
      end

      private
      def before_action
            @gym = Gym.find(params[:id])
      end
end
