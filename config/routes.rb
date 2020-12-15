Rails.application.routes.draw do
  resources :orders
  devise_for :users
  get "cart/index"
  resources :books
  root "static_pages#home"

  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"

  get "/login" => "user#login"
  get "/logout" => "user#logout"

  get "/cart/clear" => "cart#clear"
  get "/cart" => "cart#index"
  get "/cart/:id" => "cart#add"
  get "/cart/remove/:id" => "cart#remove"
  get "/cart/increase/:id" => "cart#increase"
  get "/cart/decrease/:id" => "cart#decrease"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
