class RemoveAccountTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :accounts
  end
end
