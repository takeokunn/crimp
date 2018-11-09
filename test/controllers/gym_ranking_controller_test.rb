require 'test_helper'

class GymRankingControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get gym_ranking_top_url
    assert_response :success
  end

end
