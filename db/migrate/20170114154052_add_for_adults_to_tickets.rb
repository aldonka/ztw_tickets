class AddForAdultsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :for_adults, :boolean
  end
end
