class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.belongs_to :organizer, index: true
      t.string :avatar
      t.string :name
      t.string :position
      t.string :bio

      t.timestamps
    end
  end
end
