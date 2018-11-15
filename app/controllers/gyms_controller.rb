class GymsController < ApplicationController
      before_action :before_action, only: [:show, :edit_d_info, :edit_f_info, :update] 
      def index
            @gym = Gym.all
      end

      def show
      end

      def edit_d_info 
      end

      def edit_f_info
      end

      def update
            
      end

      private
      def before_action
            @gym = Gym.find(params[:id])
      end
end
