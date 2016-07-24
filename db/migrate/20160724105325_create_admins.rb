class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.references :user, index: true
      t.string :email, index: true, unique: true
      t.integer :role
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
