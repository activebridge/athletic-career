class AddCulumnsToResultTable < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :position, :string
    add_column :results, :category_position, :string
    add_column :results, :gender, :boolean
  end
end
