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

ActiveRecord::Schema.define(version: 20151223190159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alphabets", force: :cascade do |t|
    t.string   "letter",        limit: 2
    t.string   "pronunciation"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "origin_id"
    t.text     "opinion"
    t.integer  "up_votes"
    t.integer  "down_votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["origin_id"], name: "index_comments_on_origin_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "definitions", force: :cascade do |t|
    t.integer  "user_id",     default: 1
    t.integer  "word_id"
    t.text     "explanation"
    t.integer  "verified",    default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "definitions", ["user_id"], name: "index_definitions_on_user_id", using: :btree
  add_index "definitions", ["word_id"], name: "index_definitions_on_word_id", using: :btree

  create_table "examples", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "user_id"
    t.text     "written"
    t.string   "vocal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "examples", ["user_id"], name: "index_examples_on_user_id", using: :btree
  add_index "examples", ["word_id"], name: "index_examples_on_word_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "user_id"
    t.string   "image_url"
    t.integer  "verified",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree
  add_index "images", ["word_id"], name: "index_images_on_word_id", using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "local"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "origins", force: :cascade do |t|
    t.integer  "word_id"
    t.integer  "user_id",      default: 1
    t.text     "story"
    t.integer  "endorsements", default: 0
    t.integer  "verified",     default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "origins", ["user_id"], name: "index_origins_on_user_id", using: :btree
  add_index "origins", ["word_id"], name: "index_origins_on_word_id", using: :btree

  create_table "pronunciations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.string   "phonetic"
    t.string   "vocal"
    t.integer  "verified",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "pronunciations", ["user_id"], name: "index_pronunciations_on_user_id", using: :btree
  add_index "pronunciations", ["word_id"], name: "index_pronunciations_on_word_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "handle"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "words", force: :cascade do |t|
    t.integer  "alphabet_id"
    t.integer  "user_id",     default: 1
    t.string   "spelling"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "words", ["alphabet_id"], name: "index_words_on_alphabet_id", using: :btree
  add_index "words", ["user_id"], name: "index_words_on_user_id", using: :btree

  add_foreign_key "comments", "origins"
  add_foreign_key "comments", "users"
  add_foreign_key "definitions", "users"
  add_foreign_key "definitions", "words"
  add_foreign_key "examples", "users"
  add_foreign_key "examples", "words"
  add_foreign_key "images", "users"
  add_foreign_key "images", "words"
  add_foreign_key "origins", "users"
  add_foreign_key "origins", "words"
  add_foreign_key "pronunciations", "users"
  add_foreign_key "pronunciations", "words"
  add_foreign_key "words", "alphabets"
  add_foreign_key "words", "users"
end
