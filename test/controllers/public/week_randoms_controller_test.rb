require "test_helper"

class Public::WeekRandomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_week_randoms_new_url
    assert_response :success
  end

  test "should get show" do
    get public_week_randoms_show_url
    assert_response :success
  end
end
