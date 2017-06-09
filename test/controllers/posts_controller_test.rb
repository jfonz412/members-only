require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:test_user)
  end
  test "should get new" do
    log_in_as(@user)
    get new_post_url
    assert_response :success
    assert_select "title", "New Post | Members Only!"
  end

  test "should get index" do
    log_in_as(@user)
    get posts_url
    assert_response :success
    assert_select "title", "All Posts | Members Only!"
  end
end
