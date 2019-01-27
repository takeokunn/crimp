# frozen_string_literal: true

class PostLikesController < ApplicationController
	def create
    if PostLike.create(user_id: current_user.id, post_id: params[:post_id])
			redirect_back(fallback_location: gym_path(params[:gym_id]))
		else
			redirect_to root_path
		end
	end

	def destroy
    if PostLike.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
			redirect_back(fallback_location: gym_path(params[:gym_id]))
		else
			redirect_to root_path
		end
	end
end
