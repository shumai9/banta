Rails.application.routes.draw do

  mount ActionCable.server => "/cable"

  devise_for :users

  resources :users
  resources :rooms do
    post :messages, to: 'messages#create'
  end

  root to: "rooms#index"

  post '/rooms/:id', to: 'messages#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
