class AddNameToShipper < ActiveRecord::Migration[5.1]
  def change
  	add_column :shippers, :name, :string
  end
end
