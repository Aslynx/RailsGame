# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20180220160112) do

  create_table "games", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "genre"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "games_tournaments", :id => false, :force => true do |t|
    t.integer  "game_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "games_tournaments", ["game_id"], :name => "index_games_tournaments_on_game_id"
  add_index "games_tournaments", ["tournament_id"], :name => "index_games_tournaments_on_tournament_id"

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "city"
    t.string   "country"
    t.integer  "max_players"
    t.string   "poster_file_name"
    t.integer  "poster_file_size"
    t.string   "poster_content_type"
    t.datetime "poster_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "street"
    t.string   "state"
  end

end
