FactoryGirl.define do
	factory :ticket do
		event_id "1"
		status "0"
		user_id "2"
		seat "3"
		row "18"

		user
		event
		
	end
end