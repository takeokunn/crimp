class GymsController < ApplicationController
      before_action :before_action, only: [:show, :edit, :update] 
      def index
            @gym = Gym.all
      end

      def show
      end

      def edit 
      end

      def update
          @gym.update(params.require(:gym).permit(:gym_name, :place, :access))
          redirect_to gyms_path
      end

      private
      def before_action
            @gym = Gym.find(params[:id])
      end
end
