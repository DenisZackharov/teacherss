# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_08_192143) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "field_of_studies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_field_of_studies_on_name", unique: true
  end

  create_table "organization_field_of_studies", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "field_of_study_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_of_study_id"], name: "index_organization_field_of_studies_on_field_of_study_id"
    t.index ["organization_id"], name: "index_organization_field_of_studies_on_organization_id"
  end

  create_table "organization_subjects", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "subject_id"], name: "index_organization_subjects_on_organization_id_and_subject_id", unique: true
    t.index ["organization_id"], name: "index_organization_subjects_on_organization_id"
    t.index ["subject_id"], name: "index_organization_subjects_on_subject_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "kind", default: "school", null: false
    t.string "subdomain", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subdomain"], name: "index_organizations_on_subdomain", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "middle_name"
    t.string "full_name"
    t.string "role", null: false
    t.string "category"
    t.float "work_experience_in_months"
    t.date "birthdate"
    t.date "hired_date"
    t.integer "minimum_working_hours_per_week"
    t.integer "maximum_working_hours_per_week"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email", "organization_id"], name: "index_users_on_email_and_organization_id", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "organization_field_of_studies", "field_of_studies"
  add_foreign_key "organization_field_of_studies", "organizations"
  add_foreign_key "organization_subjects", "organizations"
  add_foreign_key "organization_subjects", "subjects"
end
