require 'test_helper'

class ScheduleEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule_event = schedule_events(:one)
  end

  test "should get index" do
    get schedule_events_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_event_url
    assert_response :success
  end

  test "should create schedule_event" do
    assert_difference('ScheduleEvent.count') do
      post schedule_events_url, params: { schedule_event: { description: @schedule_event.description, end_date: @schedule_event.end_date, patient_id: @schedule_event.patient_id, schedule_id: @schedule_event.schedule_id, start_date: @schedule_event.start_date, title: @schedule_event.title } }
    end

    assert_redirected_to schedule_event_url(ScheduleEvent.last)
  end

  test "should show schedule_event" do
    get schedule_event_url(@schedule_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_event_url(@schedule_event)
    assert_response :success
  end

  test "should update schedule_event" do
    patch schedule_event_url(@schedule_event), params: { schedule_event: { description: @schedule_event.description, end_date: @schedule_event.end_date, patient_id: @schedule_event.patient_id, schedule_id: @schedule_event.schedule_id, start_date: @schedule_event.start_date, title: @schedule_event.title } }
    assert_redirected_to schedule_event_url(@schedule_event)
  end

  test "should destroy schedule_event" do
    assert_difference('ScheduleEvent.count', -1) do
      delete schedule_event_url(@schedule_event)
    end

    assert_redirected_to schedule_events_url
  end
end
