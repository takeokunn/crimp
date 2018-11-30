# frozen_string_literal: true

class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :gym_id, :bigint
    remove_column :posts, :post_id, :bigint
  end
end
