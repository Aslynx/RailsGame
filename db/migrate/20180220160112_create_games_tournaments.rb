class CreateGamesTournaments < ActiveRecord::Migration
  def change
    create_table :games_tournaments, id: false do |t|
      t.references :game
      t.references :tournament

      t.timestamps
    end
    add_index :games_tournaments, :game_id
    add_index :games_tournaments, :tournament_id
  end
end
