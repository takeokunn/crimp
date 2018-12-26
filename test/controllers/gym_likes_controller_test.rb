# frozen_string_literal: true

require 'test_helper'
include Warden::Test::Helpers

class GymLikesControllerTest < ActionDispatch::IntegrationTest
	def setup
		Warden.test_mode!
    @user = users( :john )
		@gym = gyms(:one)
	end

	test "create gym_likes" do
		sign_in(@user)
		post gym_gym_like_path(@gym), params: { user_id: @user.id}
		assert_redirected_to gym_path(@gym)
	end
end
