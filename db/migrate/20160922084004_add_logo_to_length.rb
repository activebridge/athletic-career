class AddLogoToLength < ActiveRecord::Migration[5.0]
  def change
    add_column :lengths, :logo, :string
  end
end
