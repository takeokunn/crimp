require 'test_helper'

class GymEditTest < ActionDispatch::IntegrationTest
	Devise::Test::IntegrationHelpers
	test "gym info edit test" do

		def setup
			@user = users(:john)
			@gym = gyms(:one)
		end

		#question: ArgumentError: wrong number of arguments (given 1, expected 2)のエラーが消えない。
		test "unsuccessful edit" do
			sign_in users(:john)
			get edit_gym_path, params: { id: @gym.id }
			assert_template "gyms/edit"
			patch gym_path, params: { id: @gym.id, gym: {gym_name: "test", place: "shibuya", station: "shibuya", access: "駅から五分"} }

		end


	end
end
