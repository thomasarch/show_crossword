require 'test_helper'

class WeaveFiveControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weave_five_show_url
    assert_response :success
  end

end
