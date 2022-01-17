require "test_helper"

class AttendeeEventControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get attendee_event_create_url
    assert_response :success
  end
end
