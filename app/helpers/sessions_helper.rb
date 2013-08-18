module SessionsHelper
# by default these are available in the views and not the controller
# need to include SessionsHelper in the application conroller
	def sign_in(user)
		cookies[:remember_token] = { value: user.remember_token, expires: 20.years.from_now }
	end
end
