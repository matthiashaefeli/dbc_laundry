class DeleteColumnBoxidShippers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :shippers, :box_id
  end
end