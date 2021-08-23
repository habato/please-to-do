Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "rooms#index"

  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    collection do
      get 'search'
    end
  end

  resources :rooms, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :requests, only: [:index, :new, :create]
    resources :users, only: [:destroy]
  end

  resources :requests, only: [:show, :edit, :update, :destroy] do
    resources :completions, only: :create
    resources :comments, only: [:create, :destroy]
  end
end
