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
            
      end

      private
      def before_action
            @gym = Gym.find(params[:id])
      end
end
