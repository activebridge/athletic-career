class ChangeTypeForYear < ActiveRecord::Migration[5.0]
  def change
    remove_column :protocols, :year
    add_column :protocols, :birthday, :datetime
  end
end
