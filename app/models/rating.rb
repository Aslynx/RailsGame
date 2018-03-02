class Rating < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  attr_accessible :score
  
end
