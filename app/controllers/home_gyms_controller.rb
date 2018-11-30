# frozen_string_literal: true

class HomeGymsController < ApplicationController
  def create
    HomeGym.create(gym_id: params[:gym_id], user_id: current_user.id)
    redirect_back(fallback_location: gym_path(params[:gym_id]))
  end

  def destroy
    HomeGym.find_by(user_id: current_user.id).destroy
    redirect_back(fallback_location: gym_path(params[:gym_id]))
  end
end
