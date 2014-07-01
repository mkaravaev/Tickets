class Event < ActiveRecord::Base

	validates :title, :description, :place_id, :scheduled_at_time, presence: true
	
  belongs_to :place
	has_many	 :tickets, dependent: :destroy

end
