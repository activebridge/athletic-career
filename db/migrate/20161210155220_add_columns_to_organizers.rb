class AddColumnsToOrganizers < ActiveRecord::Migration[5.0]
  def change
    add_column :organizers, :logo, :string
    add_column :organizers, :site, :string
    add_column :organizers, :description, :string
  end
end
