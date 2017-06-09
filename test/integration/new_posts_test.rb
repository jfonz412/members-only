require 'test_helper'

class NewPostsTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:test_user)
		@post = Post.new(title:"Title", body: "test" * 10, user_id: @user.id)
	end	

	test "post is valid" do
		assert @post.valid?
	end

	test "invalid post" do
		log_in_as(@user)
		get new_post_path
		assert_no_difference 'Post.count' do
			post posts_path, params: { post: { title:   "",
																				 body:    "",
																				 user_id: @user.id } }
		end
		assert_template 'posts/new'
	end

	test "valid post" do
		log_in_as(@user)
		get new_post_path
		assert_difference 'Post.count' do
			post posts_path, params: { post: { title:   "Title",
																				 body:    "a" * 30,
																				 user_id: @user.id } }
		end
		follow_redirect!
		assert_template 'posts/show'
	end

	test "post index" do
		get posts_path
		assert_template 'posts/index'
	end

end
