class AddEventAndDistanceToCareer < ActiveRecord::Migration[5.0]
  def change
    add_reference :careers, :event, foreign_key: true
    add_reference :careers, :distance, foreign_key: true
  end
end
