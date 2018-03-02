class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :score
      t.references :game
      t.references :user

      t.timestamps
    end
    add_index :ratings, :game_id
    add_index :ratings, :user_id
  end
end
