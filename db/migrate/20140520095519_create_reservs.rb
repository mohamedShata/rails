class CreateReservs < ActiveRecord::Migration
  def change
    create_table :reservs do |t|
      t.references :user
      t.references :room
      t.date :checkin
      t.date :checkout

      t.timestamps
    end
    add_index :reservs, :user_id
    add_index :reservs, :room_id
  end
end
