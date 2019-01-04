# frozen_string_literal: true

class CreateOverallGymReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :overall_gym_reviews do |t|
      t.references :gym, foreign_key: true
      t.decimal :overall_score, default: 0
      t.decimal :problems_quality, default: 0
      t.decimal :cost_par_fee, default: 0
      t.decimal :comfortableness, default: 0
      t.decimal :service, default: 0
      t.timestamps
    end
  end
end
