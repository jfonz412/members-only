class PostsController < ApplicationController

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
  		render 'new'
  	end
  end

  def index
  end

  def show
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :body)
  	end
end
