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

ActiveRecord::Schema.define(version: 2018_08_07_174159) do

  create_table "four_letter_words", force: :cascade do |t|
    t.string "word"
    t.string "l0"
    t.string "l1"
    t.string "l2"
    t.string "l3"
    t.string "clue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "split_words", force: :cascade do |t|
    t.string "word"
    t.string "l0"
    t.string "l1"
    t.string "l2"
    t.string "l3"
    t.string "l4"
    t.string "l5"
    t.string "l6"
    t.string "l7"
    t.string "l8"
    t.string "l9"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
