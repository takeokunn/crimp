# frozen_string_literal: true

class CreateGymLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :gym_likes do |t|
      t.references :gym, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
