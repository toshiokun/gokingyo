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

ActiveRecord::Schema.define(version: 20150829073202) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "answer_flg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "adress"
    t.string   "profile"
    t.string   "company_image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "user_id"
    t.string   "name",                    null: false
    t.string   "place",                   null: false
    t.datetime "start_time",              null: false
    t.datetime "end_time",                null: false
    t.text     "content",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "event_image"
    t.integer  "category_id", default: 1, null: false
  end

  add_index "events", ["user_id"], name: "index_idobatas_on_user_id", using: :btree

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "micropost_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorites", ["micropost_id"], name: "index_favorites_on_micropost_id", using: :btree
  add_index "favorites", ["user_id"], name: "index_favorites_on_user_id", using: :btree

  create_table "microposts", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id",   null: false
    t.string   "comment",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["event_id"], name: "index_microposts_on_event_id", using: :btree
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.string   "question_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.integer  "user_id"
    t.integer  "event_id",   null: false
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["event_id", "user_id"], name: "index_tickets_on_event_id_and_user_id", unique: true, using: :btree
  add_index "tickets", ["user_id", "event_id"], name: "index_tickets_on_user_id_and_event_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,           null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username",               default: "anonymous"
    t.string   "name",                   default: "",          null: false
    t.string   "profile",                default: ""
    t.string   "user_image"
    t.integer  "sil_point",              default: 0,           null: false
    t.integer  "user_status",            default: 0,           null: false
    t.string   "full_name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
