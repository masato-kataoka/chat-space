Rails.application.routes.draw do
  devise_for :users
  root to: "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resource :messages, only: [:index, :create, :new]
  end
  resources :messages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
