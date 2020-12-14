Rails.application.routes.draw do
  get 'cart/index'
  resources :books
  root "static_pages#home"

  get "/home" => "static_pages#home"
  get "/about" => "static_pages#about"

  get "/login", to: "user#login"
  get "/logout", to: "user#logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
