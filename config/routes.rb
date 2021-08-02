Rails.application.routes.draw do
  devise_for :users
  get 'requests/index'
  root to: "requests#index"
end
