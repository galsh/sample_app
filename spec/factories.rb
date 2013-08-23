# a gem used to create an object for testing

FactoryGirl.define do
	# this has to be user so that factory girl knows how to referenc
	#the correct model (user model)
	factory :user do
		sequence(:name) { |n| "Person #{n+90}" } 
		sequence(:email) { |n| "person_#{n+90}@example.com"}
		password "password"
		password_confirmation "password" 
		
		#not bound by attr_accessor
		factory :admin do
			admin true
		end
	end
end

