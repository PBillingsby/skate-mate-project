Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions
  resources :users, only: [:new, :create, :show]
  resources :locations, only: [:create, :show]
  root 'users#index'
  get '/login', to: 'sessions#new'
  post '/logout', to: 'sessions#destroy'
end
