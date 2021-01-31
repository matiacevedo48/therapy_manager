class ScheduleEvent < ApplicationRecord
  belongs_to :patient
  belongs_to :user

  def self.fullcalendar_events(user_id)
    fullcalendar_events = []
    User.find(user_id).schedule_events.each do |schedule_event|
      fullcalendar_events.append({
        id: schedule_event.id,
        title: schedule_event.title,
        start: schedule_event.start_date,
        end: schedule_event.end_date,
        description: schedule_event.description
      })
    end
    fullcalendar_events
  end
end
