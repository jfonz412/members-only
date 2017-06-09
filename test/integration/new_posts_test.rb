require 'test_helper'

class NewPostsTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:test_user)
		@post = Post.new(title:"Title", body: "test" * 10, user_id: @user.id)
	end	

	test "post is valid" do
		assert @post.valid?
	end

	
end
