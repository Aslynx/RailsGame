module GamesHelper

  # Table with all the options for the form select or the genre
  def select_genre_options
    [
      ['MOBA', Game::MOBA],
      ['STR', Game::FPS],
      ['MMO', Game::MMO],
      ['FPS', Game::FPS],
      ['FIGHTING', Game::FIGHTING]
    ]
  end

end
