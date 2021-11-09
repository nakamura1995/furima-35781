Rails.application.routes.draw do

root to: "users#index"
  devise_for :users
  resources :items, only: [:index]
  resources :users, only: [:index, :edit,:new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
