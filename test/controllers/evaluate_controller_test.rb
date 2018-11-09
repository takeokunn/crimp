require 'test_helper'

class EvaluateControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get evaluate_create_url
    assert_response :success
  end

end
