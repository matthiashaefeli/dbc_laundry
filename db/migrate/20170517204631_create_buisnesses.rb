class CreateBuisnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :buisnesses do |t|
      t.string :name
      t.string :email
      t.string :hash_password

      t.timestamps
    end
  end
end
