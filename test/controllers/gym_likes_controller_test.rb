# frozen_string_literal: true

require 'test_helper'


class GymLikesControllerTest < ActionDispatch::IntegrationTest
	include Devise::Test::ControllerHelpers
#question: deviseのgithubの通りにログインのメソッド、sign_inをしようとしたが、NoMethodError: undefined method `env' for nil:NilClassと出て失敗
	def setup
		@user = users(:john)
		@gym = gyms(:one)
	end

	test "create gym_likes" do
		#sign_in @user
		post gym_gym_like_path(@gym), params: { user_id: @user.id}
		assert_redirected_to gym_path(@gym)
	end
end
