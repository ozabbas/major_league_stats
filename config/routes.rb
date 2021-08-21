Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :players
  
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :teams, only: [:create]

end
