class CreateGymLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :gym_likes do |t|
      t.bigint :user_id
      t.bigint :gym_id

      t.timestamps
    end
  end
end
