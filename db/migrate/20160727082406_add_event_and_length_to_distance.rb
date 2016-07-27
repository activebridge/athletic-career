class AddEventAndLengthToDistance < ActiveRecord::Migration[5.0]
  def change
    add_reference :distances, :event, foreign_key: true
    add_reference :distances, :length, foreign_key: true
  end
end
