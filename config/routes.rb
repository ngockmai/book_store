Rails.application.routes.draw do
  get 'publishers/index'
  get 'publishers/show'
  get 'authors/index'
  get 'authors/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'books#index'
  get 'about', to: 'about#index'
  # get 'books', to: 'books#index'
  resources :books do
    collection do
      get 'search'
    end
  end

  resources :authors, :publishers, :pages
end
