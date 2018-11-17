Rails.application.routes.draw do
  devise_for :users
  root to: 'bars#index'
  resources :users, only: [] do
    resources :bars, only: %i[new create]
  end
  resources :bars, only: %i[show edit update destroy]
end
