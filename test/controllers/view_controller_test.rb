require 'test_helper'

class ViewControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get view_new_url
    assert_response :success
  end

end
