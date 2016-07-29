class RemoveVisibleFromDistances < ActiveRecord::Migration[5.0]
  def change
    remove_column :distances, :visible
  end
end
