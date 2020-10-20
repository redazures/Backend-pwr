Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'

  resources :messages
  resources :patients
  resources :ledgers
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
