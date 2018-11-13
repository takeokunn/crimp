class GymsController < ApplicationController
      def show
            @gym =Gym.find(params[:id])
      end
end
