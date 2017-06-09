class PostsController < ApplicationController
	  before_action :logged_in_user, only: [:new]

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	@post.user_id = current_user.id
  	if @post.save
  		flash[:success] = "Post Created!"
  		redirect_to @post
  	else
  		flash.now[:warning] = "There were errors with your post."
  		render new_post_path
  	end
  end

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find_by(id: params[:id])
  	@user = User.find_by(id: @post.user_id)
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end
end
