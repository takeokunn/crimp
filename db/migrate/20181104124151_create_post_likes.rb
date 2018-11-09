class CreatePostLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :post_likes do |t|
      t.bigint :user_id
      t.bigint :post_id

      t.timestamps
    end
  end
end
