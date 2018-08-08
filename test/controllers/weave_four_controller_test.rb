require 'test_helper'

class WeaveFourControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weave_four_show_url
    assert_response :success
  end

end
