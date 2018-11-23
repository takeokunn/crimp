class AddColumnToGymReview < ActiveRecord::Migration[5.2]
  def change
    add_column :gym_reviews, :overall_score, :decimal
  end
end
