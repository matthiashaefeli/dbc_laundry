class AddColumnToShipper < ActiveRecord::Migration[5.1]
  def change
  	add_column :shippers, :box_id, :integer
  end
end
