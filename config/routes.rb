RailsGame::Application.routes.draw do
  resources :games
  resources :tournaments
  resources :users
  resources :participations

  root to: 'tournaments#index'
end
