class AddTicketsNoToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :tickets_no, :integer
  end
end
