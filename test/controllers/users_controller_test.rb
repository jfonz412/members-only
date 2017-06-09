require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test_user)
  end

  test "should get new(signup)" do
    get signup_url
    assert_response :success
    assert_select "title", "Sign-Up | Members Only!"
  end

  test "should get users(index)" do
    log_in_as(@user)
  	get users_url
  	assert_response :success
  	assert_select "title", "All Users | Members Only!"
  end
end
