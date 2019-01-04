# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.bigint :user_id
      t.bigint :post_id
      t.text :problem_caption
      t.text :overall_caption

      t.timestamps
    end
  end
end
