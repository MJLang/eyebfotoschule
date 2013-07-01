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

ActiveRecord::Schema.define(version: 20130701043524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assets", force: true do |t|
    t.string   "category"
    t.string   "description"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "assets", ["attachable_id", "attachable_type"], name: "index_assets_on_attachable_id_and_attachable_type", using: :btree

  create_table "bookings", force: true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "email"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "persons"
  end

  create_table "course_dates", force: true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",    default: false
  end

  add_index "course_dates", ["course_id"], name: "index_course_dates_on_course_id", using: :btree

  create_table "courses", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "markdown_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ready",                default: false
    t.integer  "position"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "name"
  end

  create_table "prices", force: true do |t|
    t.decimal  "amount"
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prices", ["course_id"], name: "index_prices_on_course_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "tiles", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.integer  "image_id"
    t.string   "format"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width",      default: 1
    t.integer  "height",     default: 1
  end

  add_index "tiles", ["course_id"], name: "index_tiles_on_course_id", using: :btree

  create_table "timeframes", force: true do |t|
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "days"
    t.string   "description"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timeframes", ["course_id"], name: "index_timeframes_on_course_id", using: :btree

  create_table "trainings", force: true do |t|
    t.integer  "course_id"
    t.integer  "booking_id"
    t.integer  "timeframe_id"
    t.integer  "price_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "course_date_id"
    t.datetime "date"
  end

  add_index "trainings", ["booking_id"], name: "index_trainings_on_booking_id", using: :btree
  add_index "trainings", ["course_id"], name: "index_trainings_on_course_id", using: :btree
  add_index "trainings", ["price_id"], name: "index_trainings_on_price_id", using: :btree
  add_index "trainings", ["timeframe_id"], name: "index_trainings_on_timeframe_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
