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

ActiveRecord::Schema.define(version: 20130909055557) do

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "place_id"
    t.date     "scheduled_at_date"
    t.time     "scheduled_at_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id"
  add_index "events", ["scheduled_at_date"], name: "index_events_on_scheduled_at_date"

  create_table "tickets", force: true do |t|
    t.string   "number",     null: false
    t.integer  "user_id"
    t.integer  "event_id"
    t.integer  "status"
    t.boolean  "used"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id"
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
