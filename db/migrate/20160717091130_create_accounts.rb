class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references  :user, index: true
      t.string      :provider
      t.string      :uid
      t.string      :name
      t.string      :token

      t.timestamps
    end
  end
end
