class Game < ActiveRecord::Base
  attr_accessible :title, :description, :genre

  # All genres possible
  MOBA = 1.freeze
  STR = 2.freeze
  MMO = 3.freeze
  FPS = 4.freeze
  FIGHTING = 5.freeze

  def genre_string
    case self.genre
    when Game::MOBA
      "MOBA"
    when Game::STR
      "STR"
    when Game::MMO
      "MMO"
    when Game::FPS
      "FPS"
    else
      "FIGHTING"
    end
  end

end
