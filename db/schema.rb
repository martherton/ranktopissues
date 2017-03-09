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

ActiveRecord::Schema.define(version: 20170309115025) do

  create_table "comments", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.text     "commentbody"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "issuecats", force: :cascade do |t|
    t.string   "issuecatname"
    t.boolean  "issubcat"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "maincat_id"
  end

  create_table "issuecats_issues", force: :cascade do |t|
    t.integer "issuecat_id"
    t.integer "issue_id"
  end

  create_table "issuecats_sources", force: :cascade do |t|
    t.integer "issuecat_id"
    t.integer "source_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "issuetitle"
    t.integer  "category"
    t.text     "issuedescription"
    t.text     "issueofficialview"
    t.integer  "user_id"
    t.boolean  "officialoverride"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "subcategory"
    t.boolean  "archive"
    t.integer  "votes_count"
    t.string   "issuechart_file_name"
    t.string   "issuechart_content_type"
    t.integer  "issuechart_file_size"
    t.datetime "issuechart_updated_at"
    t.string   "imsource"
    t.integer  "posvote"
    t.integer  "negvote"
  end

  create_table "sources", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "issue_id"
    t.string   "sourceurl"
    t.text     "extradescription"
    t.string   "qualityofsource"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "sourcepdf_file_name"
    t.string   "sourcepdf_content_type"
    t.integer  "sourcepdf_file_size"
    t.datetime "sourcepdf_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "issue_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.boolean  "direction"
    t.integer  "subcategory_id"
  end

end
