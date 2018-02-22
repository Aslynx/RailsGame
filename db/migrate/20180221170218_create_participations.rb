class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations, id: false do |t|
      t.references :user
      t.references :games_tournament

      t.timestamps
    end
    add_index :participations, :user_id
    add_index :participations, :games_tournament_id
  end
end
