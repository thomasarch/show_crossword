require 'test_helper'

class WeaveEightControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get weave_eight_show_url
    assert_response :success
  end

end
