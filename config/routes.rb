Rails.application.routes.draw do
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  get '/chat_groups/new', to: 'group#new'
  post '/chat_groups', to: 'group#create'
  get '/chat_groups/:id/messages', to: 'group#index'
  post '/chat_groups/:id/messages', to: 'group#update'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
