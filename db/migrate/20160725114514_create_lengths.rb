class CreateLengths < ActiveRecord::Migration[5.0]
  def change
    create_table :lengths do |t|
      t.string :title
      t.boolean :visible, default: false
    end
  end
end
