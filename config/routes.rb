Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :rooms, only: [:new, :create] do
    resources :requests, only: [:index, :new, :create, :show, :edit, :update]
  end
end
