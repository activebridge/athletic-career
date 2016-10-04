class AddNameToLengths < ActiveRecord::Migration[5.0]
  def change
    add_column :lengths, :name, :string
  end
end
