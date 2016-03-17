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

ActiveRecord::Schema.define(version: 20160316203631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "content",     default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content",    default: "",    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "course_id"
    t.integer  "rating"
    t.boolean  "graduate",   default: false
  end

  add_index "comments", ["course_id"], name: "index_comments_on_course_id", using: :btree
  add_index "comments", ["rating"], name: "index_comments_on_rating", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "title",       default: "",        null: false
    t.text     "description", default: "",        null: false
    t.string   "language",    default: "Русский", null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "paid",        default: false
    t.boolean  "approved",    default: false,     null: false
    t.string   "url"
  end

  add_index "courses", ["title"], name: "index_courses_on_title", unique: true, using: :btree

  create_table "questions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.string   "content",    default: "", null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "questions", ["course_id"], name: "index_questions_on_course_id", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "user", null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username"
    t.string   "github_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "courses"
  add_foreign_key "questions", "users"
end
