module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id # automatically encrypted
	end

	# used to retrieve user on subsequent pages
	# because sessions_helper.rb is included in the main app controller,
	# it can be called in many different places like:
	# <%= current_user.name %> in a view
	# redirect_to current_user in a controller
	def current_user
		# assigns if nil, otherwise leaves it alone
		@current_user ||= User.find_by(id: session[:user_id]) 
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end
end
