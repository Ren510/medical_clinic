require 'test_helper'

class Admin::PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_patients_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_patients_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_patients_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_patients_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get admin_patients_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get admin_patients_withdraw_url
    assert_response :success
  end

end
