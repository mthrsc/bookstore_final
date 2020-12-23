Rails.application.routes.draw do
  root "static_pages#home"

  get "orderbooks/index"
  get "orderbooks/show"
  get "orderbooks/new"
  get "orderbooks/edit"
  get "user/edit"

  resources :orders do
    resources :orderbooks
  end

  devise_for :users do
    resources :orders
  end

  get "/checkout" => "cart#createOrder"

  get "cart/index"
  resources :books

  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"

  get "/cart/clear" => "cart#clear"
  get "/cart" => "cart#index"
  get "/cart/:id" => "cart#add"
  get "/cart/remove/:id" => "cart#remove"
  get "/cart/increase/:id" => "cart#increase"
  get "/cart/decrease/:id" => "cart#decrease"

  post "/search" => "books#search"
  post "/filter" => "books#filter"

  #Added for admin console
  get "/admin/index"
  get "admin" => "admin#index"
  get "/admin/manageusers" => "admin#manage_users"
  get "/admin/managebooks" => "admin#manage_books"
  post "/searchuser" => "admin#searchuser"
  post "/searchbook" => "admin#searchbook"

  get "/promote/:id" => "admin#promote"
  get "/demote/:id" => "admin#demote"
  get "/showuser/:id" => "admin#showuser"
  get "/showbook/:id" => "admin#showbook"

  get "/enable/:id" => "admin#enable"
  get "/disable/:id" => "admin#disable"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
