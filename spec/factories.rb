# a gem used to create an object for testing

FactoryGirl.define do
	# this has to be user so that factory girl knows how to referenc
	#the correct model (user model)
	factory :user do
		name "Gavin Walsh"
		email "galsh@example.com"
		password ""
		password_confirmation "" 
	
	end
end

