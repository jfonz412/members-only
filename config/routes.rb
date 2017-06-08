Rails.application.routes.draw do
  root   'users#show'
  get    '/signup',    to: 'users#new'
  post   '/signup',    to: 'users#create'
  resources :users
end
