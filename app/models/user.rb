class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :gym_likes, dependent: :destroy
  has_many :post_likes, dependent: :destroy 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
