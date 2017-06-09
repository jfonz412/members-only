require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get newpost_url
    assert_response :success
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

end
