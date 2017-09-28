Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :books do
    resources :reviews
  end
  root 'books#index'
end
