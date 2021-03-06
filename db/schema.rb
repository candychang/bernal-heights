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

ActiveRecord::Schema.define(version: 20160502180118) do

  create_table "admins", force: :cascade do |t|
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
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  default: false
    t.string   "name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.time     "start_time"
    t.date     "end_date"
    t.time     "end_time"
    t.string   "location"
    t.text     "description"
    t.string   "creator_name"
    t.string   "creator_email"
    t.string   "event_organizer"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "approved",        default: false
  end

  create_table "hotspotissues", force: :cascade do |t|
    t.integer "hotspot_id"
    t.integer "issue_id"
  end

  create_table "hotspots", force: :cascade do |t|
    t.string   "location"
    t.string   "details"
    t.integer  "report_num"
    t.boolean  "to_share",       default: false
    t.string   "creator_name"
    t.string   "creator_email"
    t.string   "creator_number"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "walk",           default: false
    t.date     "occurred_date"
    t.time     "occurred_time"
    t.string   "region"
    t.boolean  "archive",        default: false
    t.string   "status"
  end

  create_table "issues", force: :cascade do |t|
    t.string "issue_type"
  end

  create_table "resources", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "phone"
    t.string   "link"
    t.integer  "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
