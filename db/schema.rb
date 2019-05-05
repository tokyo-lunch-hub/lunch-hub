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

ActiveRecord::Schema.define(version: 2019_05_05_150720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "meals", force: :cascade do |t|
    t.uuid "shops_id"
    t.string "name", null: false
    t.text "description", null: false
    t.decimal "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shops_id"], name: "index_meals_on_shops_id"
  end

  create_table "owners", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchase_meals", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.bigint "meal_id", null: false
    t.integer "meal_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_purchase_meals_on_meal_id"
    t.index ["purchase_id"], name: "index_purchase_meals_on_purchase_id"
  end

  create_table "purchase_status_histories", force: :cascade do |t|
    t.bigint "purchase_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_id"], name: "index_purchase_status_histories_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.uuid "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "shops", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "owner_id"
    t.integer "status", null: false
    t.string "zipcode", null: false
    t.string "address", null: false
    t.string "branch_name", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "prefecture_id"
    t.index ["owner_id"], name: "index_shops_on_owner_id"
    t.index ["prefecture_id"], name: "index_shops_on_prefecture_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name_kana", null: false
    t.string "last_name_kana", null: false
    t.string "phone_number"
    t.datetime "last_logged_in_at", default: -> { "now()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "meals", "shops", column: "shops_id"
  add_foreign_key "purchase_meals", "meals"
  add_foreign_key "purchase_meals", "purchases"
  add_foreign_key "purchase_status_histories", "purchases"
  add_foreign_key "purchases", "users"
  add_foreign_key "shops", "owners"
  add_foreign_key "shops", "prefectures"
end
