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

ActiveRecord::Schema.define(version: 20150121223615) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "field_id",   limit: 4
    t.string   "address_1",  limit: 255
    t.string   "address_2",  limit: 255
    t.string   "city",       limit: 255
    t.integer  "state_id",   limit: 4
    t.string   "zip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "claimed_students", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "student_id",        limit: 4
    t.string   "content",           limit: 255
    t.integer  "contact_type_id",   limit: 4
    t.integer  "recruit_status_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "hidden",     limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ensembles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fields", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "index",       limit: 4
    t.integer  "group_id",    limit: 4
    t.string   "description", limit: 255
    t.string   "options",     limit: 255
    t.boolean  "hidden",      limit: 1
    t.boolean  "locked",      limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instruments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "options", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "field_id",   limit: 4
    t.string   "choice",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recruit_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "hidden",     limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "abbreviation", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "student_instruments", force: :cascade do |t|
    t.integer  "student_id",    limit: 4
    t.integer  "instrument_id", limit: 4
    t.integer  "ensemble_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "email",      limit: 255
    t.boolean  "recruit",    limit: 1,   default: true
    t.boolean  "archive",    limit: 1,   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texts", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "field_id",   limit: 4
    t.string   "content",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  limit: 1,   default: false
    t.boolean  "director",               limit: 1,   default: false
    t.boolean  "recruiter",              limit: 1,   default: true
    t.boolean  "student_leader",         limit: 1,   default: false
    t.boolean  "chief_of_staff",         limit: 1,   default: false
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
