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

ActiveRecord::Schema.define(version: 20181104124701) do

  create_table "gym_likes", force: :cascade do |t|
    t.bigint   "user_id"
    t.bigint   "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_reviews", force: :cascade do |t|
    t.bigint   "user_id"
    t.decimal  "cost_par_fee"
    t.decimal  "problems_quality"
    t.decimal  "service"
    t.decimal  "comfortableness"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string   "gym_name"
    t.text     "place"
    t.string   "station"
    t.text     "access"
    t.string   "open_time"
    t.string   "admission"
    t.string   "rent_fee"
    t.string   "begginer_wall"
    t.string   "wall_num"
    t.string   "store"
    t.string   "wall_height"
    t.string   "weekly_problems"
    t.text     "rules"
    t.string   "frequency_of_change_holds"
    t.string   "training_space"
    t.string   "free_wifi"
    t.text     "parking"
    t.string   "problem_num"
    t.text     "others"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint   "user_id"
    t.bigint   "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint   "user_id"
    t.string   "gym_name"
    t.bigint   "post_id"
    t.string   "user_rank"
    t.text     "problem_caption"
    t.text     "overall_caption"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password"
    t.string   "home_gym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
