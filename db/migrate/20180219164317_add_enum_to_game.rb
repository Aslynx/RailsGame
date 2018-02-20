class AddEnumToGame < ActiveRecord::Migration
  def change
    add_column :games, :genre, :integer
  end
end
