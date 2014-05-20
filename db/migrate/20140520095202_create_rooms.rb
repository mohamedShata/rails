class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :number
      t.string :img
      t.integer :capacity
      t.references :hotel
      t.float :price

      t.timestamps
    end
    add_index :rooms, :hotel_id
  end
end
