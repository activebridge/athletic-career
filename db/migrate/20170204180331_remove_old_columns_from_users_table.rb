class RemoveOldColumnsFromUsersTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :competitions, :race
    remove_column :competitions, :distance, :string
    remove_column :competitions, :city
    remove_column :competitions, :year
  end
end
