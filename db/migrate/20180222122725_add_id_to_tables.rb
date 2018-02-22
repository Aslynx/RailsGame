class AddIdToTables < ActiveRecord::Migration
  def change
    add_column :games_tournaments, :id, :primary_key, first: true
    add_column :participations, :id, :primary_key, first: true
  end
end
