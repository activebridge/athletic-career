class CreatePersonalBests < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_bests do |t|
      t.references :user, index: true
      t.time :km5
      t.time :km10
      t.time :km15
      t.time :half
      t.time :marathon
      t.time :ultra

      t.timestamps
    end
  end
end
