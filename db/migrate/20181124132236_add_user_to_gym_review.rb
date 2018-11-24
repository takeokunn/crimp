class AddUserToGymReview < ActiveRecord::Migration[5.2]
  def change
    add_reference :gym_reviews, :user, foreign_key: true
    add_reference :gym_reviews, :gym, foreign_key: true
  end
end
