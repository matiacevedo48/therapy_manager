json.extract! session, :id, :patient_id, :user_id, :therapy, :treatment, :date, :time, :symptom, :created_at, :updated_at
json.url session_url(session, format: :json)
