require 'test_helper'

class InternationalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @international = internationals(:one)
  end

  test "should get index" do
    get internationals_url
    assert_response :success
  end

  test "should get new" do
    get new_international_url
    assert_response :success
  end

  test "should create international" do
    assert_difference('International.count') do
      post internationals_url, params: { international: { country: @international.country, name: @international.name } }
    end

    assert_redirected_to international_url(International.last)
  end

  test "should show international" do
    get international_url(@international)
    assert_response :success
  end

  test "should get edit" do
    get edit_international_url(@international)
    assert_response :success
  end

  test "should update international" do
    patch international_url(@international), params: { international: { country: @international.country, name: @international.name } }
    assert_redirected_to international_url(@international)
  end

  test "should destroy international" do
    assert_difference('International.count', -1) do
      delete international_url(@international)
    end

    assert_redirected_to internationals_url
  end
end
