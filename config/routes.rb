Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :players
  
  resources :users, only: [:create]
  resources :teams, only: [:create]
  resources :sessions, only: [:create, :user_authenticate]
  get 'sessions/user_authenticate', to: 'sessions#user_authenticate'
  get 'users/:id/teams', to: 'users#teams'
end
