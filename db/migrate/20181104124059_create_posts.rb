# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :problem_caption
			t.text :overall_caption
			t.text :aircaption

      t.timestamps
    end
  end
end
