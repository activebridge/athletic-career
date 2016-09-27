class AddMarkToLength < ActiveRecord::Migration[5.0]
  def change
    add_column :lengths, :mark, :integer, default: 1000
  end
end
