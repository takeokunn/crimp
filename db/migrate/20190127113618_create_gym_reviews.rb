class CreateGymReviews < ActiveRecord::Migration[5.2]
  def change
		create_table :gym_reviews do |t|
			t.decimal :cost_par_fee
      t.decimal :problems_quality
      t.decimal :service
			t.decimal :comfortableness
			t.decimal :overall_score

			t.references :user, foreign_key: true
			t.references :gym, foreign_key: true
    end
  end
end
