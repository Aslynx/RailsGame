RailsGame::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

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
