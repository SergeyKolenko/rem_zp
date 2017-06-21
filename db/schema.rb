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

ActiveRecord::Schema.define(version: 20170615125446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.string "postal_address"
    t.string "phisical_address"
    t.text "description"
    t.boolean "approved", default: false
    t.bigint "director_id"
    t.string "phone"
    t.index ["director_id"], name: "index_agencies_on_director_id"
    t.index ["name"], name: "index_agencies_on_name"
  end

  create_table "agencies_cities", id: false, force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.bigint "city_id", null: false
    t.index ["agency_id", "city_id"], name: "index_agencies_cities_on_agency_id_and_city_id"
    t.index ["city_id", "agency_id"], name: "index_agencies_cities_on_city_id_and_agency_id"
  end

  create_table "agencies_districts", id: false, force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.bigint "district_id", null: false
    t.index ["agency_id", "district_id"], name: "index_agencies_districts_on_agency_id_and_district_id"
    t.index ["district_id", "agency_id"], name: "index_agencies_districts_on_district_id_and_agency_id"
  end

  create_table "agencies_regions", id: false, force: :cascade do |t|
    t.bigint "agency_id", null: false
    t.bigint "region_id", null: false
    t.index ["agency_id", "region_id"], name: "index_agencies_regions_on_agency_id_and_region_id"
    t.index ["region_id", "agency_id"], name: "index_agencies_regions_on_region_id_and_agency_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "weight"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "categories_options", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "option_id", null: false
    t.index ["category_id", "option_id"], name: "index_categories_options_on_category_id_and_option_id"
    t.index ["option_id", "category_id"], name: "index_categories_options_on_option_id_and_category_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.index ["name"], name: "index_cities_on_name"
    t.index ["region_id"], name: "index_cities_on_region_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_districts_on_city_id"
    t.index ["name"], name: "index_districts_on_name"
  end

  create_table "option_values", force: :cascade do |t|
    t.string "value"
    t.bigint "proposal_id"
    t.bigint "option_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_option_values_on_option_id"
    t.index ["proposal_id"], name: "index_option_values_on_proposal_id"
    t.index ["value"], name: "index_option_values_on_value"
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_options_on_name"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.float "promo_price"
    t.string "currency"
    t.string "street"
    t.string "house_number"
    t.boolean "approved"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.bigint "city_id"
    t.bigint "region_id"
    t.bigint "district_id"
    t.string "images", default: [], array: true
    t.index ["author_id"], name: "index_proposals_on_author_id"
    t.index ["category_id"], name: "index_proposals_on_category_id"
    t.index ["city_id"], name: "index_proposals_on_city_id"
    t.index ["district_id"], name: "index_proposals_on_district_id"
    t.index ["price"], name: "index_proposals_on_price"
    t.index ["region_id"], name: "index_proposals_on_region_id"
    t.index ["title"], name: "index_proposals_on_title"
  end

  create_table "proposals_types", id: false, force: :cascade do |t|
    t.bigint "type_id", null: false
    t.bigint "proposal_id", null: false
    t.index ["proposal_id", "type_id"], name: "index_proposals_types_on_proposal_id_and_type_id"
    t.index ["type_id", "proposal_id"], name: "index_proposals_types_on_type_id_and_proposal_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "index_regions_on_name"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.bigint "role_id"
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "phone"
    t.string "unconfirmed_email"
    t.index ["agency_id"], name: "index_users_on_agency_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "cities", "regions"
  add_foreign_key "districts", "cities"
  add_foreign_key "option_values", "options"
  add_foreign_key "option_values", "proposals"
end
