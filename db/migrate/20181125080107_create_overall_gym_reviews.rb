# frozen_string_literal: true

class CreateOverallGymReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :overall_gym_reviews do |t|
      t.references :gym, foreign_key: true
      t.decimal :overall_score
      t.decimal :problems_quality
      t.decimal :cost_par_fee
      t.decimal :comfortableness
      t.decimal :service
      t.timestamps
    end
  end
end
