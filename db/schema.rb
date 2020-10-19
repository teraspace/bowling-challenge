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

ActiveRecord::Schema.define(version: 2020_10_18_231249) do

  create_table "games", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_id"
    t.integer "rolls"
    t.integer "score"
    t.integer "frame_1_roll_1"
    t.integer "frame_1_roll_2"
    t.integer "frame_2_roll_1"
    t.integer "frame_2_roll_2"
    t.integer "frame_3_roll_1"
    t.integer "frame_3_roll_2"
    t.integer "frame_4_roll_1"
    t.integer "frame_4_roll_2"
    t.integer "frame_5_roll_1"
    t.integer "frame_5_roll_2"
    t.integer "frame_6_roll_1"
    t.integer "frame_6_roll_2"
    t.integer "frame_7_roll_1"
    t.integer "frame_7_roll_2"
    t.integer "frame_8_roll_1"
    t.integer "frame_8_roll_2"
    t.integer "frame_9_roll_1"
    t.integer "frame_9_roll_2"
    t.integer "frame_10_roll_1"
    t.integer "frame_10_roll_2"
    t.integer "frame_10_roll_3"
    t.integer "frame_1_total"
    t.integer "frame_2_total"
    t.integer "frame_3_total"
    t.integer "frame_4_total"
    t.integer "frame_5_total"
    t.integer "frame_6_total"
    t.integer "frame_7_total"
    t.integer "frame_8_total"
    t.integer "frame_9_total"
    t.integer "frame_10_total"
    t.boolean "finished", default: false
    t.integer "frame"
  end

  create_table "players", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_players_on_authentication_token", unique: true
    t.index ["email"], name: "index_players_on_email", unique: true
    t.index ["reset_password_token"], name: "index_players_on_reset_password_token", unique: true
  end

end
