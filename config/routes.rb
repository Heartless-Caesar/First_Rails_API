Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :books

      post '/login', to: 'users#login'
      post 'book/create', to: 'books#create'
      put 'book/:id', to: 'books#update'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
