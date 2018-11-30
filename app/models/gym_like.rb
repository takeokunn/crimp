# frozen_string_literal: true

class GymLike < ApplicationRecord
  belongs_to :gym
  belongs_to :user
end
