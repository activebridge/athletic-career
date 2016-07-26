class AddOrganizerAndCategoryToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :category, foreign_key: true
    add_reference :events, :organizer, foreign_key: true
  end
end
