class AddColumnShipperidToOrders < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :shipper_id, :integer
  end
end
