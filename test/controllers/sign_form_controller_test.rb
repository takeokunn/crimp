require 'test_helper'

class SignFormControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get sign_form_sign_up_url
    assert_response :success
  end

end
