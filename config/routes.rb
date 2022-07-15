Rails.application.routes.draw do
  devise_for :pet_cares
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "adoptions#index"
  resources :adoptions, only: [:show]
  resources :animals, only: [:index]
end
