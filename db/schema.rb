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

ActiveRecord::Schema.define(version: 2018_11_17_132047) do

  create_table "gym_likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gym_reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.decimal "cost_par_fee"
    t.decimal "problems_quality"
    t.decimal "service"
    t.decimal "comfortableness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyms", force: :cascade do |t|
    t.string "gym_name"
    t.text "place"
    t.string "station"
    t.text "access"
    t.string "open_time"
    t.string "admission"
    t.string "rent_fee"
    t.string "begginer_wall"
    t.string "wall_num"
    t.string "store"
    t.string "wall_height"
    t.string "weekly_problems"
    t.text "rules"
    t.string "frequency_of_change_holds"
    t.string "training_space"
    t.string "free_wifi"
    t.text "parking"
    t.string "problem_num"
    t.text "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "gym_name"
    t.string "user_rank"
    t.text "problem_caption"
    t.text "overall_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "gym_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
