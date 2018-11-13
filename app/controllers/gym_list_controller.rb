class GymListController < ApplicationController
  def top
    @gym = Gym.all
  end
end
