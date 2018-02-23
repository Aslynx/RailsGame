class Match < ActiveRecord::Base
  belongs_to :participation
  belongs_to :participation2, :class_name => :Participation, :foreign_key => "participation2_id"
  attr_accessible :score_user1, :score_user2

  # All outcomes possibles
  WIN = 3.freeze
  DRAW = 1.freeze
  LOSS = 0.freeze

  def result_of_match
    result = [Match::WIN, Match::DRAW, Match::LOSS].sample

    self.score_user1 = result

    case result
    when Match::WIN
      self.score_user2 = Match::LOSS
    when Match::DRAW
      self.score_user2 = Match::DRAW
    else
      self.score_user2 = Match::WIN
    end
  
  end
  
end
