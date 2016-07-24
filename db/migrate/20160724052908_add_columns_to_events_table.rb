class AddColumnsToEventsTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :url, :site
    add_column :events, :banner, :string
    add_column :events, :visible, :boolean, default: false
  end
end
