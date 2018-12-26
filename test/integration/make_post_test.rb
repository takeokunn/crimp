require 'test_helper'

class MakePostTest < ActionDispatch::IntegrationTest
  include Warden::Test::Helpers

  def setup
    Warden.test_mode!
    @user = users( :john )
		login_as(@user, :scope => :user)
		@gym = gyms( :one )
	end

	test "make post" do
		get new_gym_post_path(@gym)
		assert_template 'posts/new'
	end
end
