class Game < ActiveRecord::Base

  has_many :games_tournaments
  has_many :tournaments, through: :games_tournaments

  attr_accessible :title, :description, :genre, :image

  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

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
      "Fighting"
    end
  end

  def to_s
    title
  end

end
