RailsGame::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", confirmations: 'confirmations' }

  resources :dashboard
  resources :games do
    resources :ratings
  end
  resources :tournaments do
    get '/simulate' => 'tournaments#simulate'
  end
  resources :users
  resources :participations

  resources :notifications, only: [:index] do
    post :mark_as_read, on: :collection
    post :mark_as_read, on: :member
  end 

  get '/rankings' => 'users#ranking'

  root to: 'dashboard#index'
end
