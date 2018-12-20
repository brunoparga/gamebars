Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [] do
    resources :bars, only: %i[new create]
  end
  resources :bars, only: %i[index show edit update destroy]
end
