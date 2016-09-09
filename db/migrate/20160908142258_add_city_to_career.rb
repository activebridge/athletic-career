class AddCityToCareer < ActiveRecord::Migration[5.0]
  def change
    add_column :careers, :city, :string
  end
end
