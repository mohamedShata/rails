class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :resev

	def self.getRooms(hotelName, city, country, checkin, checkout)
		Room.find_by_sql(["SELECT * FROM rooms WHERE hotel_id = ( SELECT id FROM hotels WHERE name like ? AND city like ? AND country like ? ) AND rooms.id NOT IN ( SELECT room_id FROM reservs WHERE checkin BETWEEN ? AND ? OR checkout BETWEEN ? AND ? ) OR number > (SELECT COUNT(*) FROM reservs WHERE room_id= rooms.id)","%"+hotelName+"%", "%"+city+"%", "%"+country+"%", checkin, checkout, checkin, checkout])
	end 	
end
