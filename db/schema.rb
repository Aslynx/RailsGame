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

ActiveRecord::Schema.define(:version => 20180228112540) do

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

  create_table "games_tournaments", :force => true do |t|
    t.integer  "game_id"
    t.integer  "tournament_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "games_tournaments", ["game_id"], :name => "index_games_tournaments_on_game_id"
  add_index "games_tournaments", ["tournament_id"], :name => "index_games_tournaments_on_tournament_id"

  create_table "matches", :force => true do |t|
    t.integer  "participation_id"
    t.integer  "participation2_id"
    t.integer  "score_user1"
    t.integer  "score_user2"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "matches", ["participation2_id"], :name => "index_matches_on_participation2_id"
  add_index "matches", ["participation_id"], :name => "index_matches_on_participation_id"

  create_table "participations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "games_tournament_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "participations", ["games_tournament_id"], :name => "index_participations_on_games_tournament_id"
  add_index "participations", ["user_id"], :name => "index_participations_on_user_id"

  create_table "tournaments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "max_players"
    t.string   "poster_file_name"
    t.integer  "poster_file_size"
    t.string   "poster_content_type"
    t.datetime "poster_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "nb_victories",           :default => 0
    t.integer  "nb_defeats",             :default => 0
    t.integer  "total_points",           :default => 0
    t.string   "avatar_file_name"
    t.integer  "avatar_file_size"
    t.string   "avatar_content_type"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "provider"
    t.string   "uid"
    t.boolean  "admin",                  :default => false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["provider"], :name => "index_users_on_provider"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["uid"], :name => "index_users_on_uid"

end
