class GamesTournament < ActiveRecord::Base
  belongs_to :game
  belongs_to :tournament

  has_many :participations

end
