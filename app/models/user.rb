class User < ActiveRecord::Base
  attr_accessible :username, :street, :city, :state, :country, :nb_victories, :nb_defeats, :total_points, :avatar

  has_attached_file :avatar
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  has_many :participations
  has_many :games_tournaments, through: :participations
  has_many :games, through: :games_tournaments
  has_many :tournaments, through: :games_tournaments

  def inscription(game, tournament)
    found_games_tournament = GamesTournament.where(game_id: game, tournament_id: tournament)
    puts found_games_tournament
    self.games_tournaments += found_games_tournament
    found_game = Game.where(id: game)
    #self.games += found_game
    found_tournament = Tournament.where(name: tournament)
    #self.tournaments += found_tournament
  end
end
