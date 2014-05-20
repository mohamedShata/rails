require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login_attempt" do
    get :login_attempt
    assert_response :success
  end

end
