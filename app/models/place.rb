class Place < ActiveRecord::Base

	validates :name, :location, :address, :description, presence: true
	
end
