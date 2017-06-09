class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Account created!"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  def show
  	@user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all
  end

  private
  	def user_params
  		# :user is the params[:user] nested hash the form creates when submited
  		params.require(:user).permit(:name, :email, :password,
  																 :password_confirmation)
  	end
end
