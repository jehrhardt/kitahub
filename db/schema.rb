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

ActiveRecord::Schema.define(version: 20161211115716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admins", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid   "user_id"
    t.string "first_name", null: false
    t.string "last_name",  null: false
    t.index ["user_id"], name: "index_admins_on_user_id", using: :btree
  end

  create_table "candidates", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.uuid     "registration_id"
    t.uuid     "child_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["child_id"], name: "index_candidates_on_child_id", using: :btree
    t.index ["registration_id"], name: "index_candidates_on_registration_id", using: :btree
  end

  create_table "children", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birth_date"
    t.string   "gender"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.uuid     "parents_id"
    t.index ["parents_id"], name: "index_children_on_parents_id", using: :btree
  end

  create_table "nurseries", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "address_street"
    t.string   "address_zip"
    t.string   "address_city"
    t.string   "phone"
    t.string   "mail"
    t.string   "children_age"
    t.string   "care_time"
    t.string   "education_concept"
    t.string   "management"
    t.string   "capacity"
    t.string   "district"
    t.string   "url_name"
    t.index ["url_name"], name: "index_nurseries_on_url_name", using: :btree
  end

  create_table "parents", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "user_id"
    t.index ["user_id"], name: "index_parents_on_user_id", using: :btree
  end

  create_table "registrations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid     "nursery_id"
    t.date     "preferred_start_date"
    t.index ["nursery_id"], name: "index_registrations_on_nursery_id", using: :btree
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "admins", "users"
  add_foreign_key "children", "parents"
  add_foreign_key "parents", "users"
  add_foreign_key "registrations", "nurseries"
end
