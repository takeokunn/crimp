# frozen_string_literal: true

class GymReview < ApplicationRecord
  belongs_to :user
  belongs_to :gym
end
