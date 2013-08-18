module SessionsHelper
# by default these are available in the views and not the controller
# need to include SessionsHelper in the application conroller
	def sign_in(user)
		cookies[:remember_Token] = { value: user.remember_Token, expires: 20.years.from_now }
	end
end
