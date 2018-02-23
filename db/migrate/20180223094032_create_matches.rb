class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :participation
      t.references :participation2
      t.integer :score_user1
      t.integer :score_user2

      t.timestamps
    end
    add_index :matches, :participation_id
    add_index :matches, :participation2_id
  end
end
