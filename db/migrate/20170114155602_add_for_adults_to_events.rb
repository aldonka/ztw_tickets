class AddForAdultsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :for_adults, :boolean
  end
end
