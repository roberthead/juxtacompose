Rails.application.routes.draw do
  devise_for :users

  resources :pitches, only: [:index]

  root to: 'home#show'
end
