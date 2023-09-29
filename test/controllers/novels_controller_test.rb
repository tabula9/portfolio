require "test_helper"

class NovelsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get novels_search_url
    assert_response :success
  end
end
