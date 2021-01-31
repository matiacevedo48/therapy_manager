json.extract! schedule_event, :id, :title, :description, :start_date, :end_date, :patient_id, :schedule_id, :created_at, :updated_at
json.url schedule_event_url(schedule_event, format: :json)
