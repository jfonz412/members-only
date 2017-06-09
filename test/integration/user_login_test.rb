require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:test_user)
	end

	test "login with invalid information" do
		get login_path
		assert_template 'sessions/new'
		post login_path params: { session: { email: "", password: "" } }
		assert_template 'sessions/new'
		assert_not flash.empty?
		#make sure flash doesn't follow
		get root_path
		assert flash.empty?
	end

	test "login with valid information" do
		get login_path
		post login_path, params: { session: { email: 		@user.email,
																					password: 'password' } }
		assert_redirected_to @user
	end
end
