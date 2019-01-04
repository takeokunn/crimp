# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :gym
	has_many :post_likes, dependent: :destroy
	validates :overall_caption, presence: true
end
