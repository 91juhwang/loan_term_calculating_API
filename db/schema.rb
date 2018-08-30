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

ActiveRecord::Schema.define(version: 2018_08_30_025044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "zip_code"
    t.string "city_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string "property_name"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_properties_on_address_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "monthly_rent"
    t.string "unit_number"
    t.boolean "vacancy"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.integer "annual_total"
    t.bigint "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_units_on_property_id"
  end

  add_foreign_key "addresses", "cities"
  add_foreign_key "expenses", "properties"
  add_foreign_key "properties", "addresses"
  add_foreign_key "units", "properties"
end
