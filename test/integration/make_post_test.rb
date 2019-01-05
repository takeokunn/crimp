require 'test_helper'

class MakePostTest < ActionDispatch::IntegrationTest
	Devise::Test::IntegrationHelpers

  def setup
    @user = users( :john )
		@gym = gyms( :one )
	end

	#memo ActionView::Template::Error: undefined method `calculate_overall_score_rank' for nil:NilClassが最後のgym_pathへのリダイレクトで起こる。原因は、そのジムの@overall_gym_reviewが、ジムの作成時に一つも存在しないから
	test "make post" do
		login_as users(:john)
		get new_gym_post_path(@gym)
		assert_template 'posts/new'
		assert_no_difference 'Post.count' do
			post gym_posts_path, params: { id: @user.id, gym_id: @gym.id, post: {overall_caption: "" } }
		end
		assert_difference 'Post.count', 1 do
			post gym_posts_path, params: { id: @user.id, gym_id: @gym.id, post: {overall_caption: "great!!" } }
		end
		assert_redirected_to gym_path(@gym)
		follow_redirect!
	end
end
