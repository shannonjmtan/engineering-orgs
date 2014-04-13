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

ActiveRecord::Schema.define(version: 20140413084720) do

  create_table "club_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "club_types_clubs", id: false, force: true do |t|
    t.integer "club_type_id", null: false
    t.integer "club_id",      null: false
  end

  add_index "club_types_clubs", ["club_id", "club_type_id"], name: "index_club_types_clubs_on_club_id_and_club_type_id"
  add_index "club_types_clubs", ["club_type_id", "club_id"], name: "index_club_types_clubs_on_club_type_id_and_club_id"

  create_table "clubs", force: true do |t|
    t.string   "name"
    t.string   "president"
    t.string   "year"
    t.string   "email"
    t.string   "website"
    t.text     "logo"
    t.text     "description"
    t.text     "joining"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs_majors", id: false, force: true do |t|
    t.integer "club_id",  null: false
    t.integer "major_id", null: false
  end

  add_index "clubs_majors", ["club_id", "major_id"], name: "index_clubs_majors_on_club_id_and_major_id"
  add_index "clubs_majors", ["major_id", "club_id"], name: "index_clubs_majors_on_major_id_and_club_id"

  create_table "majors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.boolean  "site_admin", default: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
