RailsGame::Application.routes.draw do
  resources :games
  resources :tournaments do
    get '/simulate' => 'tournaments#simulate'
  end
  resources :users
  resources :participations

  root to: 'tournaments#index'
end
