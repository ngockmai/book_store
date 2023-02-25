Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'books#index'
  get 'about', to: 'about#index'
  # get 'books', to: 'books#index'
  resources :books
end
