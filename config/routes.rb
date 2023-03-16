Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :lists, only: [:new, :create, :index, :show, :destroy] do
    resources :items, only: [:new, :create]
  end
  resources :items, only: [:show, :destroy]
  root 'lists#index'
end
