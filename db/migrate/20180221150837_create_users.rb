class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :nb_victories
      t.integer :nb_defeats
      t.integer :total_points
      

      #Paperclip attributes
      t.string :avatar_file_name
      t.integer :avatar_file_size
      t.string :avatar_content_type
      t.datetime :avatar_updated_at

      t.timestamps
    end
  end
end
