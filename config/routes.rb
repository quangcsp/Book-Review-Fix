Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :users

  resources :books do
    resources :reviews do
      resources :comments
    end
  end


  root 'books#index'
end
