Rails.application.routes.draw do
  root "blogs#index"
  resources :blogs
  resources :users, only: %i[ new create show ]
end
