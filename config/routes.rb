Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :orders, only: %i[index]

  resolve("OrderSearch") { route_for :orders }

  # Defines the root path route ("/")
  root "orders#index"
end
