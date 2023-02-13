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

ActiveRecord::Schema.define(version: 2023_02_11_012327) do

  create_table "open_api_responses", force: :cascade do |t|
    t.text "content"
    t.text "raw"
    t.string "model", null: false
    t.integer "prompt_tokens", null: false
    t.integer "completion_tokens", null: false
    t.integer "total_tokens", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "prompts_id"
    t.index ["prompts_id"], name: "index_open_api_responses_on_prompts_id"
  end

  create_table "prompts", force: :cascade do |t|
    t.integer "user_id"
    t.string "language", null: false
    t.text "prompt", null: false
    t.text "prompt_raw"
    t.string "endpoint", null: false
    t.datetime "request_time"
    t.datetime "response_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "open_api_responses", "prompts", column: "prompts_id"
end
