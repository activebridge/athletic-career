class CreateDistances < ActiveRecord::Migration[5.0]
  def change
    create_table :distances do |t|
      t.string :title
      t.integer :price
      t.integer :end_price
      t.date    :buy_ticket
      t.date    :buy_ticket_end
      t.boolean :visible, default: false
    end
  end
end
