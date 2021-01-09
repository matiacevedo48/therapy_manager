json.extract! patient, :id, :user_id, :name, :last_name, :rut, :phone_number, :email, :birthdate, :job, :civil_state, :family_info, :illness, :allergies, :surgery, :hobbies, :created_at, :updated_at
json.url patient_url(patient, format: :json)
