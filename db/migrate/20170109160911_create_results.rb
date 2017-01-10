class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.references  :distance, index: true
      t.string      :name, index: true
      t.integer     :bib_number, index: true
      t.integer     :age, index: true
      t.string      :category, index: true
      t.time        :gun_time
      t.time        :chip_time

      t.timestamps
    end
  end
end
