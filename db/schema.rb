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

ActiveRecord::Schema.define(version: 2021_01_25_060148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "participant_id"
    t.bigint "team_id"
    t.integer "position_cd"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id"], name: "index_contracts_on_participant_id"
    t.index ["team_id"], name: "index_contracts_on_team_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", default: "", null: false
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "team_size", default: 1, null: false
    t.integer "first_team_size", default: 1, null: false
    t.bigint "country_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_leagues_on_country_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name", default: "", null: false
    t.datetime "date_of_birth"
    t.bigint "country_id"
    t.datetime "caree_start"
    t.datetime "caree_end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_participants_on_country_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer "talent", default: 0, null: false
    t.integer "position_cd"
    t.bigint "participant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["participant_id"], name: "index_players_on_participant_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "league_id"
    t.bigint "city_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_teams_on_city_id"
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

end
