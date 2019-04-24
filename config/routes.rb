Rails.application.routes.draw do

  root 'books#index'
  resources :books
  devise_for :users
  resources :authors
  resources :reviews
  resources :charges

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
