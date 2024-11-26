Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :products

  # Defines the root path route ("/")
  root "products#index"
end
