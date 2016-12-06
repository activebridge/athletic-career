class AddUserToOrganizers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :organizer, index: true
  end
end
