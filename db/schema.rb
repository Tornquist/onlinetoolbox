# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150612144642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "field_id"
    t.string   "address_1",  default: ""
    t.string   "address_2",  default: ""
    t.string   "city",       default: ""
    t.integer  "state_id",   default: 1
    t.string   "zip",        default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "announcements", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claimed_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "student_id"
    t.text     "content"
    t.integer  "contact_type_id"
    t.integer  "recruit_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", force: :cascade do |t|
    t.string   "name"
    t.boolean  "hidden",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ensembles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_instruments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "instrument_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dest_id"
    t.integer  "dest_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name"
    t.integer  "index"
    t.integer  "group_id"
    t.string   "description"
    t.string   "options"
    t.boolean  "hidden"
    t.boolean  "locked",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: :cascade do |t|
    t.integer  "season_id"
    t.string   "name"
    t.date     "played_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gds", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "gds_type_id"
    t.boolean  "available",   default: true
    t.boolean  "automatic",   default: false
    t.text     "comment"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "gds_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.integer  "game_id"
    t.text     "offense"
    t.integer  "value",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "helps", force: :cascade do |t|
    t.string   "name"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "officer_ranks", force: :cascade do |t|
    t.string   "name"
    t.integer  "hours"
    t.integer  "inventory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string   "name"
    t.boolean  "hidden"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "field_id"
    t.string   "choice",     default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rank_members", force: :cascade do |t|
    t.integer  "rank_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.integer  "section_id"
    t.string   "name"
    t.integer  "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_statuses", force: :cascade do |t|
    t.string   "name"
    t.boolean  "hidden",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ribbons", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "hidden"
    t.integer  "index"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "memorization",            null: false
    t.integer  "music_effort",            null: false
    t.integer  "marching_fundamentals",   null: false
    t.integer  "marching_precision",      null: false
    t.integer  "marching_effort",         null: false
    t.integer  "rehearsal_etiquette",     null: false
    t.integer  "preparedness",            null: false
    t.integer  "punctuality",             null: false
    t.integer  "gameday_enthusiasm",      null: false
    t.integer  "gameday_professionalism", null: false
    t.text     "comment"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.date     "start"
    t.date     "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_members", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "section_notes", force: :cascade do |t|
    t.integer  "section_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "season_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_instruments", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "instrument_id"
    t.integer  "ensemble_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_officer_ranks", force: :cascade do |t|
    t.integer  "officer_rank_id"
    t.integer  "student_id"
    t.date     "date_approved"
    t.date     "date_issued"
    t.date     "date_returned"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "student_offices", force: :cascade do |t|
    t.integer  "office_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_ribbons", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "ribbon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "issued_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "recruit",    default: true
    t.boolean  "archive",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "field_id"
    t.string   "content",    default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "director",               default: false
    t.boolean  "recruiter",              default: true
    t.boolean  "student_leader",         default: false
    t.boolean  "chief_of_staff",         default: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "banned",                 default: false
    t.boolean  "recruitment_head",       default: false
    t.boolean  "recruitment_officer",    default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "fields", name: "addresses_field_id_fk"
  add_foreign_key "addresses", "states", name: "addresses_state_id_fk"
  add_foreign_key "addresses", "students", name: "addresses_student_id_fk"
  add_foreign_key "announcements", "users", name: "announcements_user_id_fk"
  add_foreign_key "claimed_students", "students", name: "claimed_students_student_id_fk"
  add_foreign_key "claimed_students", "users", name: "claimed_students_user_id_fk"
  add_foreign_key "comments", "contact_types", name: "comments_contact_type_id_fk"
  add_foreign_key "comments", "recruit_statuses", name: "comments_recruit_status_id_fk"
  add_foreign_key "comments", "students", name: "comments_student_id_fk"
  add_foreign_key "comments", "users", name: "comments_user_id_fk"
  add_foreign_key "favorite_instruments", "instruments", name: "favorite_instruments_instrument_id_fk"
  add_foreign_key "favorite_instruments", "users", name: "favorite_instruments_user_id_fk"
  add_foreign_key "fields", "groups", name: "fields_group_id_fk"
  add_foreign_key "games", "seasons", name: "games_season_id_fk"
  add_foreign_key "gds", "games", name: "gds_game_id_fk"
  add_foreign_key "gds", "gds_types", name: "gds_gds_type_id_fk"
  add_foreign_key "gds", "students", name: "gds_student_id_fk"
  add_foreign_key "gds", "users", name: "gds_user_id_fk"
  add_foreign_key "gigs", "games", name: "gigs_game_id_fk"
  add_foreign_key "gigs", "students", name: "gigs_student_id_fk"
  add_foreign_key "gigs", "users", name: "gigs_user_id_fk"
  add_foreign_key "options", "fields", name: "options_field_id_fk"
  add_foreign_key "options", "students", name: "options_student_id_fk"
  add_foreign_key "rank_members", "ranks", name: "rank_members_rank_id_fk"
  add_foreign_key "rank_members", "students", name: "rank_members_student_id_fk"
  add_foreign_key "ranks", "sections", name: "ranks_section_id_fk"
  add_foreign_key "scores", "games", name: "scores_game_id_fk"
  add_foreign_key "scores", "students", name: "scores_student_id_fk"
  add_foreign_key "scores", "users", name: "scores_user_id_fk"
  add_foreign_key "section_members", "sections", name: "section_members_section_id_fk"
  add_foreign_key "section_members", "students", name: "section_members_student_id_fk"
  add_foreign_key "section_notes", "sections", name: "section_notes_section_id_fk"
  add_foreign_key "sections", "seasons", name: "sections_season_id_fk"
  add_foreign_key "student_instruments", "ensembles", name: "student_instruments_ensemble_id_fk"
  add_foreign_key "student_instruments", "instruments", name: "student_instruments_instrument_id_fk"
  add_foreign_key "student_instruments", "students", name: "student_instruments_student_id_fk"
  add_foreign_key "texts", "fields", name: "texts_field_id_fk"
  add_foreign_key "texts", "students", name: "texts_student_id_fk"
end
