require 'test_helper'

class GymListControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get gym_list_top_url
    assert_response :success
  end

end
