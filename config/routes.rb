Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "rooms#index"
  resources :users, only: :show
  resources :rooms, only: [:new, :create, :destroy] do
    resources :requests, only: [:index, :new, :create]
  end
  resources :requests, only: [:show, :edit, :update, :destroy] do
    resources :completions, only: :create
    resources :comments, only: [:create, :destroy]
  end
end
