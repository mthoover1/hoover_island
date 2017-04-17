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

ActiveRecord::Schema.define(version: 20170417031545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer "person_id"
    t.string  "email",           limit: 255
    t.string  "password_digest", limit: 255
    t.boolean "admin",                       default: false
  end

  create_table "animal_sitings", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "lat",                    precision: 10, scale: 7
    t.decimal  "long",                   precision: 10, scale: 7
    t.integer  "trip_id"
    t.string   "notes",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fishing_spots", force: :cascade do |t|
    t.string   "size",         limit: 255
    t.string   "type_of_fish", limit: 255
    t.decimal  "lat",                      precision: 10, scale: 7
    t.decimal  "long",                     precision: 10, scale: 7
    t.string   "type_of_day",  limit: 255
    t.integer  "trip_id"
    t.string   "lure",         limit: 255
    t.string   "notes",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string  "first_name", limit: 255
    t.string  "last_name",  limit: 255
    t.string  "initials",   limit: 255
    t.integer "seniority",              default: 10
    t.boolean "hoover",                 default: false
    t.integer "spouse_id"
    t.integer "parent_id"
  end

  create_table "person_trips", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "person_id"
  end

  create_table "reservation_requests", force: :cascade do |t|
    t.integer "person_id"
    t.date    "start_date"
    t.date    "end_date"
    t.integer "visitor_count"
    t.string  "note",                  limit: 255
    t.boolean "trip_approved",                     default: false
    t.integer "reservation_status_id"
  end

  create_table "reservation_statuses", force: :cascade do |t|
    t.string "status", limit: 255
  end

  create_table "trips", force: :cascade do |t|
    t.integer "year"
    t.string  "notes",            limit: 255
    t.integer "fishing_spot_id"
    t.integer "animal_siting_id"
  end

end
