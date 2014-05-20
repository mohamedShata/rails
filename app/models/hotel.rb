class Hotel < ActiveRecord::Base
	has_many :room
	has_many :comment
	has_many :rate
	
	def self.getCountries
		find_by_sql(["SELECT DISTINCT country FROM hotels"])
	end
end
