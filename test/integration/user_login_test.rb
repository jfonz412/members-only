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
		assert is_logged_in?
		assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    # log out
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    # Simulate a user clicking logout in a second window.
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
	end

	test "login with remembering" do
		log_in_as(@user, remember_me: '1')
		assert_not_empty cookies['remember_token']
		assert_equal cookies['remember_token'], assigns(:user).remember_token
	end

	test "login without remembering" do 
		# log in to set the cookie
		log_in_as(@user, remember_me: '1')
		# log in again and verifiy that the cookie is deleted
		log_in_as(@user, remember_me: '0')
		assert_empty cookies['remember_token']
	end

	test "access private pages while logged in" do
		log_in_as(@user, remember_me: '1')
		get new_post_path
		assert :success
		get posts_path
		assert :success
		get users_path
		assert :success
		#profile page not tested
	end
end
