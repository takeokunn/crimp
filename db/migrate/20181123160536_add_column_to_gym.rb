class AddColumnToGym < ActiveRecord::Migration[5.2]
  def change
    add_column :gyms, :last_time_changing_holds, :string
    add_column :gyms, :next_time_changing_holds, :string
    add_column :gyms, :about_wall, :text
    remove_column :gyms, :wall_num, :string
    remove_column :gyms, :wall_height, :string
  end
end
