require 'test_helper'

class MakePostTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users( :john )
		@gym = gyms( :one )
	end

	test "make post" do
		login_as(@user, :scope => :user)
		get new_gym_post_path(@gym)
		assert_template 'posts/new'
		assert_no_difference 'Post.count' do
			post gym_posts_path, params: { id: @user.id, gym_id: @gym.id, post: {overall_caption: "" } }
		end
		get root_path
		assert_template 'home/top'
	end
end
