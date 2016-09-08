class AddCareerToEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :career, foreign_key: true
  end
end
