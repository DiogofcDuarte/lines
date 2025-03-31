require "test_helper"

class LinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get lines_show_url
    assert_response :success
  end
end
