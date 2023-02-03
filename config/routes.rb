Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  put '/post/:id/like', to: 'posts#like', as: 'like'
end
