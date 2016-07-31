class AddCountryAndRenamePlaceInEvents < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :place, :city
    add_column :events, :country, :string
  end
end
