class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :games_tournament
  
  has_many :matchs

end
