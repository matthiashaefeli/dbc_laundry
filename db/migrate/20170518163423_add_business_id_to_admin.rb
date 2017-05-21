class AddBusinessIdToAdmin < ActiveRecord::Migration[5.1]
  def change
  	add_column :admins, :business_id, :integer
  end
end
