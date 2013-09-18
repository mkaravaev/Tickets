FactoryGirl.define do
	factory :user do
		password "password"
		password_confirmation "password"
		email  "example@mail.ru"
	end
end
