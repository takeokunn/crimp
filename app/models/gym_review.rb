# frozen_string_literal: true

class GymReview < ApplicationRecord
  belongs_to :user
	belongs_to :gym
	validates :overall_score, presence: true
	validates :problems_quality, presence: true
	validates :cost_par_fee, presence: true
	validates :comfortableness, presence: true
	validates :service, presence: true
end
