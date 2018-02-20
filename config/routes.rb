RailsGame::Application.routes.draw do
  resources :games
  resources :tournaments

  root to: 'tournaments#index'
end
