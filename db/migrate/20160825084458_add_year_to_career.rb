class AddYearToCareer < ActiveRecord::Migration[5.0]
  def change
    add_column :careers, :year, :integer
  end
end
