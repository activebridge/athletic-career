class AddColumnsToUsersTable < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :profile, :string
    remove_column :distances, :title
  end
end
