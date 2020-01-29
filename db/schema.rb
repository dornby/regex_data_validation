# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_29_201949) do

  create_table "regular_expressions", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.string "body"
    t.boolean "is_valid"
    t.integer "regular_expression_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "test_string_id"
    t.index ["regular_expression_id"], name: "index_results_on_regular_expression_id"
    t.index ["test_string_id"], name: "index_results_on_test_string_id"
  end

  create_table "test_strings", force: :cascade do |t|
    t.string "content"
    t.string "faker_class"
    t.string "faker_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "results", "regular_expressions"
  add_foreign_key "results", "test_strings"
end
