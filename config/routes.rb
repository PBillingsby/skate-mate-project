Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy, :omniauth]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    resources :check_ins, only: [:new, :destroy]
  end
  resources :locations, only: [:create, :show, :index] do
    resources :spots
  end
  root 'users#index'
  get '/signup', to: 'users#new'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get 'auth/failure' => redirect('/')

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
end
