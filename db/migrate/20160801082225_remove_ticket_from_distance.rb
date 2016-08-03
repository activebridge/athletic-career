class RemoveTicketFromDistance < ActiveRecord::Migration[5.0]
  def change
    remove_column :distances, :buy_ticket
    remove_column :distances, :buy_ticket_end
  end
end
