FactoryGirl.define do
	factory :user do
		password "password"
		password_confirmation "password"
		sequence(:email) do |i|
			"example#{i}@mail.ru"
		end
	end
end
