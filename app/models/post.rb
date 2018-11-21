class Post < ApplicationRecord
  belongs_to :user
  belongs_to :gym
  has_many :post_likes, dependent: :destroy
end
