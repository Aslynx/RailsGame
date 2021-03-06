module TournamentsHelper

  def select_max_players_options
    [
      ['4', 4],
      ['8', 8],
      ['16', 16],
      ['32', 32],
      ['64', 64]
    ]
  end

  def select_games_options
    Game.all.collect {|g| [g.title, g.title]}
  end

end
