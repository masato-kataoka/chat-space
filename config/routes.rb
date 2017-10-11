Rails.application.routes.draw do
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  resources :group, only: [:new, :create, :edit, :update, :index]
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
