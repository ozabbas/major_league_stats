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

ActiveRecord::Schema.define(version: 2021_08_19_011754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "betting_odds", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_teams", force: :cascade do |t|
    t.bigint "team_id"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_teams_on_player_id"
    t.index ["team_id"], name: "index_player_teams_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "home_run"
    t.integer "rbi"
    t.float "avg"
    t.string "team_name"
    t.string "position"
    t.float "era"
    t.float "whip"
    t.integer "ab"
    t.integer "r"
    t.integer "h"
    t.integer "sb"
    t.float "obp"
    t.float "ops"
    t.float "wpct"
    t.integer "g"
    t.integer "gs"
    t.integer "sv"
    t.integer "ip"
    t.integer "so"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.integer "favorite_team_id"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
