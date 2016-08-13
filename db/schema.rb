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

ActiveRecord::Schema.define(version: 20160813005118) do

  create_table "saved_posts", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "query_text"
  end

  create_table "so_responses", force: :cascade do |t|
    t.string   "so_question_title"
    t.string   "so_question_body"
    t.string   "so_answer_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_querys", force: :cascade do |t|
    t.text     "user_query_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

end
