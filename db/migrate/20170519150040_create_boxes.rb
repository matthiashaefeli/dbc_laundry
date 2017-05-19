class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.integer :business_id
      t.string :address
      t.timestamps
    end
  end
end
