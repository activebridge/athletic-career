class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :user, index: true
      t.string :name
      t.string :description
      t.string :url
      t.string :logo
      t.string :place
      t.date   :date

      t.timestamps
    end
  end
end
