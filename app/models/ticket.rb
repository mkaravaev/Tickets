class Ticket < ActiveRecord::Base

	validates :number, presence: true, numericality: true, uniqueness: true
	validates :user_id, 
						:event_id, 
						:status, 
						:used, 	 presence: true,
	
	belongs_to :event

end
