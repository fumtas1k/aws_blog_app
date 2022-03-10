Rails.application.routes.draw do
  get 'sessions/new'
  root "blogs#index"
  resources :blogs
  resources :users, only: %i[ new create show ]
  resources :sessions, only: %i[ new create destroy ]
end
