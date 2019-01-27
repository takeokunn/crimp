require 'test_helper'

class GymEditTest < ActionDispatch::IntegrationTest
	include Devise::Test::IntegrationHelpers
	test "gym info edit test" do
		def setup
			@user = users(:john)
			@exam_gym = gyms(:one)
			sign_in users(:john)
		end

		#question: ArgumentError: wrong number of arguments (given 1, expected 2)のエラーが消えない。
		test "successful edit" do
			patch gym_path(@exam_gym), params: { gym: {gym_name: "test", place: "shibuya", access: "駅から五分", station: "渋谷"} }
		end
	end
end
