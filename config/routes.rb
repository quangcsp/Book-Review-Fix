Rails.application.routes.draw do
  resources :categories
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :books do
    resources :reviews do
      resources :comments
    end
  end
  resources :reviews
  resources :votes, only: [:create, :destroy]

  root 'books#index'
end
