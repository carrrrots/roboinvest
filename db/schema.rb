# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_06_193730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
    t.float "previous_close"
    t.string "country"
    t.float "day_range_low"
    t.float "day_range_high"
    t.float "year_range_low"
    t.float "year_range_high"
    t.string "market_cap"
    t.string "volume"
    t.string "pe_ratio"
    t.string "dividend_yield"
    t.string "primary_exchange"
    t.float "price_now"
    t.float "array_stock", default: [], array: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallet_stocks", force: :cascade do |t|
    t.float "investment_stock"
    t.integer "number_of_stock"
    t.bigint "wallet_id", null: false
    t.bigint "stock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "date"
    t.float "batch_cost"
    t.index ["stock_id"], name: "index_wallet_stocks_on_stock_id"
    t.index ["wallet_id"], name: "index_wallet_stocks_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.float "invested_money"
    t.float "profit"
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "img_url"
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "wallet_stocks", "stocks"
  add_foreign_key "wallet_stocks", "wallets"
  add_foreign_key "wallets", "users"
end
