# frozen_string_literal: true

class AddColumnToPost2 < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :aircaption, :text
  end
end
