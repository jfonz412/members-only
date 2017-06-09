require 'test_helper'

class PostTest < ActiveSupport::TestCase
	def setup
		@post = Post.new(title: "Test Post", body: "test"*10)
	end

	test "should be valid" do
		assert @post.valid?
	end

	test "no title" do
		@post.title = ""
		assert_not @post.valid?
	end

	test "no body" do
		@post.body = ""
		assert_not @post.valid?
	end

	test "title too long" do
		@post.title = "x" * 50
		assert_not @post.valid?
	end

	test "body too long" do
		@post.title = "x" * 600
		assert_not @post.valid?
	end
end
