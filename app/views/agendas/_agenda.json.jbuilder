json.extract! agenda, :id, :available, :taken, :patient_id, :created_at, :updated_at
json.url agenda_url(agenda, format: :json)
