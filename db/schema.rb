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

ActiveRecord::Schema.define(version: 2018_11_17_025648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_board_games", force: :cascade do |t|
    t.bigint "bar_id"
    t.bigint "board_game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_board_games_on_bar_id"
    t.index ["board_game_id"], name: "index_bar_board_games_on_board_game_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_bars_on_owner_id"
  end

  create_table "board_games", force: :cascade do |t|
    t.string "name"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_playing_time"
    t.integer "max_playing_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bar_board_games", "bars"
  add_foreign_key "bar_board_games", "board_games"
  add_foreign_key "bars", "users", column: "owner_id"
end
