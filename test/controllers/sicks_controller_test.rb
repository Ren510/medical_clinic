require 'test_helper'

class SicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sicks_index_url
    assert_response :success
  end
end
