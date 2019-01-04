require 'test_helper'

class GymEditTest < ActionDispatch::IntegrationTest
	Devise::Test::IntegrationHelpers
	test "gym info edit test" do

		def setup
			@user = users(:john)
			@gym = gyms(:one)
		end

		test "successful edit" do
			sign_in users(:john)
			get edit_gym_path(@gym)
			assert_template "gyms/edit"
			patch gym_path(@gym), params: { gym: {gym_name: "test", place: "shibuya", station: "shibuya", access: "駅から五分"} }
		end
	end
end
