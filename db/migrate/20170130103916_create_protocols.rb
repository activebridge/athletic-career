class CreateProtocols < ActiveRecord::Migration[5.0]
  def change
    create_table :protocols do |t|
      t.references :user, index: true
      t.string :first_name_ua
      t.string :last_name_ua
      t.string :first_name_ru
      t.string :last_name_ru
      t.string :first_name_en
      t.string :last_name_en
      t.integer :year

      t.timestamps
    end
  end
end
