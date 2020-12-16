Rails.application.routes.draw do
  get "orderbooks/index"
  get "orderbooks/show"
  get "orderbooks/new"
  get "orderbooks/edit"
  resources :orders do
    resources :orderbooks
  end

  devise_for :users do
    resources :orders
  end

  get "/checkout" => "cart#createOrder"

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
