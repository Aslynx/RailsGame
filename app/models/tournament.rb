class Tournament < ActiveRecord::Base
  has_many :games_tournaments
  has_many :games, through: :games_tournaments
  has_many :participations, through: :games_tournaments
  has_many :users, through: :participations

  has_attached_file :poster
  validates_attachment_content_type :poster, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  attr_accessible :name, :description, :street, :city, :state, :country, :max_players, :poster, :game_list

  def game_list
    self.games.collect do |game|
      game.title
    end.join(", ")
  end

  def game_list=(games_string)
    games_titles = games_string[1..-1].split(",").collect{|s| s}
    found_games = games_titles.collect{|title| Game.where(title: title)}
    if !found_games.nil?
      found_games.each do |f|
        self.games += f
      end
    end
  end

end
