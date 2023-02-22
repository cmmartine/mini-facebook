Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'posts#index'

  resources :posts, only: [:index, :new, :create] do
    resources :comments, only: [:new, :create]
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  put '/post/:id/like', to: 'posts#like', as: 'like'
  delete '/post/:id/unlike', to: 'posts#unlike', as: 'unlike'
  put '/request/:id/send', to: 'users#send_request', as: 'send_request'
  put '/request/:id/accept', to: 'users#accept_request', as: 'accept_request'
  delete 'request/:id/deny', to: 'users#deny_request', as: 'deny_request'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
