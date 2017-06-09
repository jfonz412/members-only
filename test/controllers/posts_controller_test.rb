require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get post_url
    assert_response :success
    assert_select "title", "New Post | Members Only!"
  end

  test "should get index" do
    get posts_url
    assert_response :success
    assert_select "title", "All Posts | Members Only!"
  end
end
