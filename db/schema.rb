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

ActiveRecord::Schema.define(version: 2019_06_19_062351) do

  create_table "currencies", force: :cascade do |t|
    t.string "ticker"
    t.string "target"
    t.string "price"
    t.string "volume"
    t.string "change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currency_markets", force: :cascade do |t|
    t.integer "market_id"
    t.integer "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "price"
    t.float "volume"
    t.index ["currency_id"], name: "index_currency_markets_on_currency_id"
    t.index ["market_id"], name: "index_currency_markets_on_market_id"
  end

  create_table "currency_portfolios", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "currency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.integer "quantity"
    t.float "transaction_total"
    t.index ["currency_id"], name: "index_currency_portfolios_on_currency_id"
    t.index ["portfolio_id"], name: "index_currency_portfolios_on_portfolio_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "risk_profile"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "currency"
    t.integer "quantity"
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "profile_picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
