Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :greetings, only: [:index, :create]

  root "sessions#new"
end
