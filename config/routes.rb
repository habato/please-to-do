Rails.application.routes.draw do
  devise_for :users
  root to: "requests#index"
  resources :rooms, only: [:new, :create]
end
