class CreateCareers < ActiveRecord::Migration[5.0]
  def change
    create_table :careers do |t|
      t.references :user, index: true
      t.string :race
      t.string :distance
      t.integer :race_number
      t.time :result
      t.time :net_result
      t.integer :rank
      t.integer :category_rank

      t.timestamps null: false
    end
  end
end
