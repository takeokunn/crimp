require 'test_helper'

class GymEditTest < ActionDispatch::IntegrationTest

	test "gym info edit test" do
		include Warden::Test::Helpers

		def setup
			Warden.test_mode!
			@user = users( :john )
			login_as(@user, :scope => :user)
			@gym = gyms(:one)
		end

		test "successful edit" do
			get gym_edit_path(@gym)
			assert_template "gyms/edit"
			patch gym_path(@gym), params: { gym_name: "test", place: "shibuya", station: "shibuya", access: "駅から五分"}
		end
	end
end
