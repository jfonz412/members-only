require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	def setup
		@user = users(:test_user)
	end
	test "layout links" do
		get root_path
		assert_template 'static_pages/home'
		assert_select "a[href=?]", root_path, count: 2
		assert_select "a[href=?]", login_path
	end

	test "layout links after login" do
		get login_path
		post login_path, params: { session: { email: 		@user.email,
																					password: 'password' } }
		assert is_logged_in?
		follow_redirect!
		assert_select "a[href=?]", users_path
		assert_select "a[href=?]", user_path
		assert_select "a[href=?]", logout_path
	end
end
