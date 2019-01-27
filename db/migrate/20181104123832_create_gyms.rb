# frozen_string_literal: true

class CreateGyms < ActiveRecord::Migration[5.0]
  def change
    create_table :gyms do |t|
      t.string :gym_name
      t.text :place
      t.string :station
      t.text :access
      t.string :open_time
      t.string :admission
      t.string :rent_fee
      t.string :begginer_wall
      t.string :store
      t.string :weekly_problems
      t.text :rules
      t.string :frequency_of_change_holds
      t.string :training_space
      t.string :free_wifi
      t.text :parking
      t.string :problem_num
			t.text :others
			t.string :last_time_changing_holds
			t.string :next_time_changing_holds
			t.text :about_wall

      t.decimal :overall_score, default: 0
      t.decimal :problems_quality, default: 0
      t.decimal :cost_par_fee, default: 0
      t.decimal :comfortableness, default: 0
      t.decimal :service, default: 0
      t.timestamps
    end
  end
end
