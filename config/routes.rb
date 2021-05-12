Rails.application.routes.draw do
  devise_for :users
  get 'authors/index'
  get 'authors/show'
  root to: "books#index"
  resources :books, :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
