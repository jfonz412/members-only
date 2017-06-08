class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Account created!"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  def show
  end

  private
  	def user_params
  		# :user is the params[:user] nested hash the form creates when submited
  		params.require(:user).permit(:name, :email, :password,
  																 :password_confirmation)
  	end
end
