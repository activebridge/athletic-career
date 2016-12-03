class AddTitleToDistances < ActiveRecord::Migration[5.0]
  def change
    add_column :distances, :title, :string
  end
end
