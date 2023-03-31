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

ActiveRecord::Schema[7.0].define(version: 2023_03_31_140909) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beneficiaries", force: :cascade do |t|
    t.string "names", null: false
    t.string "email", null: false
    t.string "first_surname", null: false
    t.string "second_surname", null: false
    t.integer "cel_phone", default: 0, null: false
    t.datetime "born", null: false
    t.string "other_address", null: false
    t.datetime "expiration_date_document", null: false
    t.boolean "status_document", default: false
    t.integer "family_unit", default: 1, null: false
    t.boolean "terms_conditions", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "identity", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "quantity", default: "0.0", null: false
    t.string "observation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "beneficiary_id", null: false
    t.index ["beneficiary_id"], name: "index_deliveries_on_beneficiary_id"
  end

  add_foreign_key "deliveries", "beneficiaries"
end
