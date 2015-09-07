class AddUserIdToTickets < ActiveRecord::Migration
  def change
    add_reference :tickets, :user, index: true
    add_foreign_key :tickets, :users
  end
end
