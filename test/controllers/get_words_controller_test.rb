require 'test_helper'

class GetWordsControllerTest < ActionDispatch::IntegrationTest
  test "should get fetch" do
    get get_words_fetch_url
    assert_response :success
  end

end
