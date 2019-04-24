Rails.application.routes.draw do

  get 'reviews/create'
  get 'reviews/new'
  devise_for :users
  get 'authors/index'
  get 'authors/show'
  root 'books#index'
  get '/books', to:'books#index'
  get '/books/new', to: 'books#new'
  get '/books/:id/edit', to: 'books#edit', as: :edit_book
  put '/books/:id', to: 'books#update'
  patch '/books/:id', to: 'books#update', as: :update_book
  post '/books/create', to: 'books#create'
  delete '/books/:id', to: 'books#delete'
  get '/books/:id', to: 'books#show', as: :book
  get '/authors/:id', to:'authors#show', as: :author
  delete '/authors/:id', to:'authors#delete', as: :delete_author
  get '/reviews/new', to:'reviews#new'
  post '/reviews/create', to:'reviews#create', as: :create_review
  delete '/reviews/:id', to:'reviews#delete', as: :delete_review

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
