PeerReview::Application.routes.draw do
  root 'reviews#index'

  resources :reviews
  resources :sessions
  resources :users

  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
end
