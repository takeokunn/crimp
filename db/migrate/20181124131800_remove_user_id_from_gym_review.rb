class RemoveUserIdFromGymReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :gym_reviews, :user_id, :bigint
  end
end
