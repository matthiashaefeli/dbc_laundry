class AddColumnHistoryToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :history, :boolean, :default => false
  end
end
