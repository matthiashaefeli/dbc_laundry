class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :box_in
      t.integer :box_out
      t.integer :client_id
      t.integer :business_id

      t.timestamps
    end
  end
end
