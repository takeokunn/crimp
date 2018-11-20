class AddPostToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user_id
    remove_column :posts, :gym_id
    
    add_reference :users, :post, foreign_key: true
  end
end
