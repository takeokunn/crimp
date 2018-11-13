class GymsController < ApplicationController
      before_action :before_action, only: [:show] 
      def index
            @gym = Gym.all
      end

      def show
      end

      private
      def before_action
            @gym = Gym.find(params[:id])
      end
end
