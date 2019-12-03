require 'test_helper'

class QandasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get qandas_new_url
    assert_response :success
  end

end
