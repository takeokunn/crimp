class CreateGymReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :gym_reviews do |t|
      t.bigint :user_id
      t.decimal :cost_par_fee
      t.decimal :problems_quality
      t.decimal :service
      t.decimal :comfortableness

      t.timestamps
    end
  end
end
