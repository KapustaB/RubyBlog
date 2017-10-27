require 'test_helper'

class Users::AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_about_show_url
    assert_response :success
  end

end
