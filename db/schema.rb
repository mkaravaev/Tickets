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

ActiveRecord::Schema.define(version: 20131107085916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "scheduled_at_time"
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id", using: :btree

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "address"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "number",                     null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "status"
    t.boolean  "used",       default: false
    t.integer  "row"
    t.integer  "seat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                                  null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
