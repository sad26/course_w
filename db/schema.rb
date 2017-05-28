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

ActiveRecord::Schema.define(version: 20170528084608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "automobiles", force: :cascade do |t|
    t.string   "automobile_model", limit: 30, null: false
    t.string   "automobile_type",             null: false
    t.string   "state_number",                null: false
    t.string   "color",            limit: 20, null: false
    t.integer  "release",                     null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "automobiles", ["state_number"], name: "index_automobiles_on_state_number", unique: true, using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "drivers", force: :cascade do |t|
    t.string   "last_name",     limit: 20, null: false
    t.string   "first_name",    limit: 20, null: false
    t.string   "patronymic",    limit: 20
    t.date     "date_of_birth",            null: false
    t.string   "itn",                      null: false
    t.string   "passport",                 null: false
    t.integer  "automobile_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "drivers", ["automobile_id"], name: "index_drivers_on_automobile_id", using: :btree
  add_index "drivers", ["itn"], name: "index_drivers_on_itn", unique: true, using: :btree
  add_index "drivers", ["passport"], name: "index_drivers_on_passport", unique: true, using: :btree

  create_table "orders", force: :cascade do |t|
    t.datetime "time_of_travel",                  null: false
    t.string   "departure_address",    limit: 64, null: false
    t.string   "arrival_address",      limit: 64, null: false
    t.integer  "number_of_passengers",            null: false
    t.float    "length_of_route",                 null: false
    t.integer  "automobile_id"
    t.integer  "tariff_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "orders", ["automobile_id"], name: "index_orders_on_automobile_id", using: :btree
  add_index "orders", ["tariff_id"], name: "index_orders_on_tariff_id", using: :btree

  create_table "role_users", force: :cascade do |t|
    t.integer  "role_id",    null: false
    t.integer  "user_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "info",       null: false
    t.text     "full_info",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["info"], name: "index_roles_on_info", unique: true, using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "tariffs", force: :cascade do |t|
    t.string   "name",                limit: 20, null: false
    t.string   "time_of_day",                    null: false
    t.string   "range",                          null: false
    t.float    "price_per_kilometer",            null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "tariffs", ["name"], name: "index_tariffs_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.date     "birthday"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "drivers", "automobiles"
  add_foreign_key "orders", "automobiles"
  add_foreign_key "orders", "tariffs"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
end
