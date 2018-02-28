class AddLatitudeLongitudeToModels < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float

    add_column :tournaments, :latitude, :float
    add_column :tournaments, :longitude, :float
  end
end
