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
      t.string :wall_num
      t.string :store
      t.string :wall_height
      t.string :weekly_problems
      t.text :rules
      t.string :frequency_of_change_holds
      t.string :training_space
      t.string :free_wifi
      t.text :parking
      t.string :problem_num
      t.text :others

      t.timestamps
    end
  end
end
