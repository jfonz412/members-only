class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private
    # Confirms a logged-in user
    def logged_in_user
    	unless logged_in? # from session helper
    	flash[:danger] = "Members only, please log in"
    	redirect_to login_url
      end
    end
end
