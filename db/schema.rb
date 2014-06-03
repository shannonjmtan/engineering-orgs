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

ActiveRecord::Schema.define(version: 20140531062508) do

  create_table "club_majors", force: true do |t|
    t.integer  "major_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_majors", ["club_id"], name: "index_club_majors_on_club_id"
  add_index "club_majors", ["major_id"], name: "index_club_majors_on_major_id"

  create_table "club_type_clubs", force: true do |t|
    t.integer  "club_type_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_type_clubs", ["club_id"], name: "index_club_type_clubs_on_club_id"
  add_index "club_type_clubs", ["club_type_id"], name: "index_club_type_clubs_on_club_type_id"

  create_table "club_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "club_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "club_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "club_users", ["club_id"], name: "index_club_users_on_club_id"
  add_index "club_users", ["user_id"], name: "index_club_users_on_user_id"

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
