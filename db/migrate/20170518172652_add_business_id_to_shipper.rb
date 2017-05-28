class AddBusinessIdToShipper < ActiveRecord::Migration[5.1]
  def change
  	 add_column :shippers, :business_id, :integer
  end
end
