class AddColumnBagIdToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :bag_id, :integer
  end
end
