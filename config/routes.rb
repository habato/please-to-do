Rails.application.routes.draw do
  get 'requests/index'
  root to: "requests#index"
end
