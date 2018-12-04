# frozen_string_literal: true

class Gym < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :gym_likes, dependent: :destroy
	has_many :overall_gym_reviews, dependent: :destroy

	scope :fit, -> {where(gym_id: params[:id])}
end
