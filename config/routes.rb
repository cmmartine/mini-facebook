Rails.application.routes.draw do
  devise_for :users

  root to: 'posts#index'

  resources :posts do
    resources :comments
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  put '/post/:id/like', to: 'posts#like', as: 'like'
  put '/request/:id/accept', to: 'users#accept_request', as: 'accept_request'
end
