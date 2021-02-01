# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_30_195544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "attentions", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.bigint "specialty_id", null: false
    t.text "treatment"
    t.date "date"
    t.time "time"
    t.text "symptom"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patients_id"
    t.index ["patient_id"], name: "index_attentions_on_patient_id"
    t.index ["patients_id"], name: "index_attentions_on_patients_id"
    t.index ["specialty_id"], name: "index_attentions_on_specialty_id"
    t.index ["user_id"], name: "index_attentions_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "rut"
    t.string "phone_number"
    t.string "email"
    t.string "birthdate"
    t.string "job"
    t.string "civil_state"
    t.text "family_info"
    t.string "illness"
    t.text "allergies"
    t.string "surgery"
    t.text "hobbies"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["last_name"], name: "index_patients_on_last_name"
    t.index ["rut"], name: "index_patients_on_rut"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "rating"
    t.text "comments"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "schedule_events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "patient_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patient_id"], name: "index_schedule_events_on_patient_id"
    t.index ["user_id"], name: "index_schedule_events_on_user_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "user_specialties", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "specialty_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["specialty_id"], name: "index_user_specialties_on_specialty_id"
    t.index ["user_id"], name: "index_user_specialties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "photo_url"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attentions", "patients"
  add_foreign_key "attentions", "patients", column: "patients_id"
  add_foreign_key "attentions", "specialties"
  add_foreign_key "attentions", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "schedule_events", "patients"
  add_foreign_key "schedule_events", "users"
  add_foreign_key "user_specialties", "specialties"
  add_foreign_key "user_specialties", "users"
end
