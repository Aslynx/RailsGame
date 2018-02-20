class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :name
      t.text :description
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :max_players

      #Paperclip attributes
      t.string :poster_file_name
      t.integer :poster_file_size
      t.string :poster_content_type
      t.datetime :poster_updated_at

      t.timestamps
    end
  end
end
