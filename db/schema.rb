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

ActiveRecord::Schema.define(version: 2018_08_30_150624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.float "marketing"
    t.float "taxes"
    t.float "insurance"
    t.float "repairs"
    t.float "administration"
    t.float "payroll"
    t.float "utility"
    t.float "management"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_expenses_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
  end

  create_table "quotes", force: :cascade do |t|
    t.float "loan_amount"
    t.float "debt_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
  end

  create_table "rent_rolls", force: :cascade do |t|
    t.float "monthly_rent"
    t.integer "unit_number"
    t.integer "vacancy"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "annual_total"
    t.index ["property_id"], name: "index_rent_rolls_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "expenses", "properties"
  add_foreign_key "rent_rolls", "properties"
end
