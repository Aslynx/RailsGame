class ChangeDefaultsVdpForUsers < ActiveRecord::Migration
  def change
    change_column :users, :nb_victories, :integer, :default => 0
    change_column :users, :nb_defeats, :integer, :default => 0
    change_column :users, :total_points, :integer, :default => 0
  end
end
