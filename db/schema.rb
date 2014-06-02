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

ActiveRecord::Schema.define(version: 20140422124631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "connections", force: true do |t|
    t.integer  "stop_1_id"
    t.integer  "stop_2_id"
    t.integer  "distance"
    t.integer  "duration"
    t.integer  "prm_duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "connections", ["stop_1_id"], :name => "index_connections_on_stop_1_id"
  add_index "connections", ["stop_2_id"], :name => "index_connections_on_stop_2_id"

  create_table "mi_systems", force: true do |t|
    t.string   "name",                         limit: 50, null: false
    t.text     "comment"
    t.text     "api_url",                                 null: false
    t.text     "api_key"
    t.date     "start_date",                              null: false
    t.date     "end_date",                                null: false
    t.integer  "multiple_starts_and_arrivals"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mi_systems", ["api_url"], :name => "index_mi_systems_on_api_url", :unique => true
  add_index "mi_systems", ["name"], :name => "index_mi_systems_on_name", :unique => true

  create_table "mi_systems_modes", id: false, force: true do |t|
    t.integer "mi_system_id", null: false
    t.integer "mode_id",      null: false
  end

  add_index "mi_systems_modes", ["mi_system_id", "mode_id"], :name => "index_mi_systems_modes_on_mi_system_id_and_mode_id"

  create_table "modes", force: true do |t|
    t.string   "mode_code",        limit: 50, null: false
    t.text     "mode_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "modes", ["mode_code"], :name => "index_modes_on_mode_code", :unique => true

  create_table "stops", force: true do |t|
    t.integer  "stop_code"
    t.integer  "mi_system_id"
    t.string   "name"
    t.integer  "stop_type"
    t.text     "administrative_code"
    t.integer  "site_ref"
    t.text     "transport_mode"
    t.text     "quay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.spatial  "shape",               limit: {:srid=>4326, :type=>"point"}
  end

  add_index "stops", ["mi_system_id"], :name => "index_stops_on_mi_system_id"

end
