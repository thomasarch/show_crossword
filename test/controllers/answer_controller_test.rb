require 'test_helper'

class AnswerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get answer_show_url
    assert_response :success
  end

end
