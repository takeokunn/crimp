class CreateHomeGyms < ActiveRecord::Migration[5.2]
  def change
    create_table :home_gyms do |t|
      t.references :gym, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
