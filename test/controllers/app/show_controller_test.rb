require 'test_helper'

class App::ShowControllerTest < ActionController::TestCase
  test "should get get" do
    get :get
    assert_response :success
  end

end
