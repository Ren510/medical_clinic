require 'test_helper'

class Admin::SicksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_sicks_index_url
    assert_response :success
  end
end
