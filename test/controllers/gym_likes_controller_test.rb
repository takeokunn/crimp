# frozen_string_literal: true

require 'test_helper'


class GymLikesControllerTest < ActionController::TestCase
	include Devise::Test::ControllerHelpers
#question: deviseのgithubの通りにログインのメソッド、sign_inをしようとしたが、NoMethodError: undefined method `env' for nil:NilClassと出て失敗
	def setup
		@user = users(:john)
		@gym = gyms(:one)
	end

	test "create gym_likes" do
		sign_in @user
		assert_difference 'GymLike.count',1 do
			post gym_gym_like_path, params: {gym_id: @gym.id}
		end
	end
end
