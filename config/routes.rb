Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :sessions, only: [:new, :create, :destroy, :omniauth]

  resources :users, only: [:index, :create, :show, :edit, :update] do
    resources :spots, only: [:show, :create, :index]
    resources :check_ins, only: [:create]
  end

  resources :locations, only: [:create, :show, :index] do
    resources :spots, only: [:show, :index, :new]
  end

  resources :spots
  resources :comments, only: [:create, :destroy]

  root 'users#index'
  get '/signup', to: 'users#new'
  get '/highest_rated', to: 'spots#index', as: 'highest_rated'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  get 'auth/failure' => redirect('/')
end
