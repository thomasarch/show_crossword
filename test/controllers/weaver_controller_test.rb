require 'test_helper'

class WeaverControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get weaver_search_url
    assert_response :success
  end

  test "should get split" do
    get weaver_split_url
    assert_response :success
  end

end
