FactoryGirl.define do
	factory :ticket do
		event_id "1"
		status "0"
		user_id "2"
		sequence(:seat) {|i| i}
		row "18"
	end
end