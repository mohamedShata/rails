class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :number
      t.string :img
      t.integer :capacity
      t.references :hotel

      t.timestamps
    end
    add_index :rooms, :hotel_id
  end
end
