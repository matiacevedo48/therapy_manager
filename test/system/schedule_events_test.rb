require "application_system_test_case"

class ScheduleEventsTest < ApplicationSystemTestCase
  setup do
    @schedule_event = schedule_events(:one)
  end

  test "visiting the index" do
    visit schedule_events_url
    assert_selector "h1", text: "Schedule Events"
  end

  test "creating a Schedule event" do
    visit schedule_events_url
    click_on "New Schedule Event"

    fill_in "Description", with: @schedule_event.description
    fill_in "End date", with: @schedule_event.end_date
    fill_in "Patient", with: @schedule_event.patient_id
    fill_in "Schedule", with: @schedule_event.schedule_id
    fill_in "Start date", with: @schedule_event.start_date
    fill_in "Title", with: @schedule_event.title
    click_on "Create Schedule event"

    assert_text "Schedule event was successfully created"
    click_on "Back"
  end

  test "updating a Schedule event" do
    visit schedule_events_url
    click_on "Edit", match: :first

    fill_in "Description", with: @schedule_event.description
    fill_in "End date", with: @schedule_event.end_date
    fill_in "Patient", with: @schedule_event.patient_id
    fill_in "Schedule", with: @schedule_event.schedule_id
    fill_in "Start date", with: @schedule_event.start_date
    fill_in "Title", with: @schedule_event.title
    click_on "Update Schedule event"

    assert_text "Schedule event was successfully updated"
    click_on "Back"
  end

  test "destroying a Schedule event" do
    visit schedule_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Schedule event was successfully destroyed"
  end
end
