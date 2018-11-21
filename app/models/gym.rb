class Gym < ApplicationRecord
  has_many :posts
  has_many :gym_likes
end
