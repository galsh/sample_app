module SessionsHelper
# by default these are available in the views and not the controller
# need to include SessionsHelper in the application conroller
	def sign_in(user) 
		cookies.permanent[:remember_token] = user.remember_token 
		self.current_user = user
		#above is a short cut for below
		# cookies[:remember_token] = { value: user.remember_token, expires: 20.years.from_now }
	end


	def signed_in?
		!current_user.nil?
	end
	#setter
	def current_user=(user)
	@current_user = user
	end

	#getter
	def current_user
		# the same as x = x + 1, x = x || 1
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
		
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "You must sign in first" 
      end
    end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
		
	end

	def store_location
		# session hash (acts like a cookie) and expires when the session closes 
		session[:return_to] = request.fullpath
	end

	def redirect_back_or(default)
		redirect_to session[:return_to] || default
		session.delete(:return_to)
	end
end
