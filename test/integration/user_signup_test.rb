require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
	test "invalid signup information" do
		get signup_path
		assert_no_difference 'User.count' do
			post signup_path, params: { user: { name:                     "",
																					email:        "user@invalid",
																					password:              "123",
																					password_confirmation: "456" } }
		end
		assert_template 'users/new'
		assert_select "div .form-control"
		assert_select "div #error_explanation"
		assert_select 'form[action="/signup"]'
	end

  test "valid signup information with account activation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
  end
end
