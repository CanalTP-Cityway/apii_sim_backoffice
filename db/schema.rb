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

  create_table "mis", force: true do |t|
    t.string   "name",                          limit: 50, null: false
    t.text     "comment"
    t.string   "api_url",                                  null: false
    t.string   "api_key"
    t.date     "start_date",                               null: false
    t.date     "end_date",                                 null: false
    t.boolean  "geographic_position_compliant"
    t.integer  "multiple_start_and_arrivals"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mis", ["api_url"], :name => "index_mis_on_api_url", :unique => true
  add_index "mis", ["name"], :name => "index_mis_on_name", :unique => true

  create_table "mis_mode", force: true do |t|
    t.integer "mis_id",  null: false
    t.integer "mode_id", null: false
  end

end
