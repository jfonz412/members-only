class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email])

  	if @user && @user.authenticate(params[:session][:password])
  		#log in user
  		redirect_to root_url
  	else
  		flash[:warning] = "Incorrect email or password"
  		render 'new'
  	end
  end
end
