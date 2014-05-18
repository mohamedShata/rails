class Hotel < ActiveRecord::Base
	has_many :room
	has_many :comment
	has_many :rate
end
