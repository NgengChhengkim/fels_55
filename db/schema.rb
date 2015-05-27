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

ActiveRecord::Schema.define(version: 20150515072857) do

  create_table "answers", force: :cascade do |t|
    t.integer  "word_id",        limit: 4
    t.string   "meaning",        limit: 255
    t.boolean  "correct_answer", limit: 1,   default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "answers", ["word_id"], name: "index_answers_on_word_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "lessons", ["category_id"], name: "index_lessons_on_category_id", using: :btree
  add_index "lessons", ["user_id", "category_id"], name: "index_lessons_on_user_id_and_category_id", using: :btree
  add_index "lessons", ["user_id"], name: "index_lessons_on_user_id", using: :btree

  create_table "relationships", force: :cascade do |t|
    t.integer  "followed_id", limit: 4
    t.integer  "follower_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "relationships", ["followed_id", "follower_id"], name: "index_relationships_on_followed_id_and_follower_id", unique: true, using: :btree
  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "email",           limit: 255
    t.string   "admin",           limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest", limit: 255
    t.string   "remember_digest", limit: 255
  end

  create_table "word_lessons", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4
    t.integer  "word_id",    limit: 4
    t.integer  "answer_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "word_lessons", ["answer_id"], name: "index_word_lessons_on_answer_id", using: :btree
  add_index "word_lessons", ["lesson_id", "word_id"], name: "index_word_lessons_on_lesson_id_and_word_id", unique: true, using: :btree
  add_index "word_lessons", ["lesson_id"], name: "index_word_lessons_on_lesson_id", using: :btree
  add_index "word_lessons", ["word_id"], name: "index_word_lessons_on_word_id", using: :btree

  create_table "words", force: :cascade do |t|
    t.string   "keyword",     limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "words", ["category_id"], name: "index_words_on_category_id", using: :btree

  add_foreign_key "answers", "words"
  add_foreign_key "lessons", "categories"
  add_foreign_key "lessons", "users"
  add_foreign_key "word_lessons", "answers"
  add_foreign_key "word_lessons", "lessons"
  add_foreign_key "word_lessons", "words"
  add_foreign_key "words", "categories"
end
