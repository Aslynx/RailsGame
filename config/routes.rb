RailsGame::Application.routes.draw do
  resources :dashboard
  resources :games
  resources :tournaments do
    get '/simulate' => 'tournaments#simulate'
  end
  resources :users
  resources :participations

  get '/rankings' => 'users#ranking'

  root to: 'dashboard#index'
end
