# frozen_string_literal: true

class Gym < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :gym_likes, dependent: :destroy
	has_many :overall_gym_reviews, dependent: :destroy

	validates :gym_name, presence: true
	validates :place, presence: true
	validates :station, presence: true
	validates :access, presence: true
end
