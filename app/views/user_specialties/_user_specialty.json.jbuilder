json.extract! user_specialty, :id, :user_id, :specialty_id, :created_at, :updated_at
json.url user_specialty_url(user_specialty, format: :json)
