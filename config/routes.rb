RailsGame::Application.routes.draw do
  resources :games
  resources :tournaments
  resources :users

  root to: 'tournaments#index'
end
