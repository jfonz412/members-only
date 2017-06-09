Rails.application.routes.draw do
  root   'static_pages#home'
  get	 '/post',   to: 'posts#new'
  post   '/post',   to: 'posts#create'
  get    '/posts',	   to: 'posts#index'
  get    '/signup',    to: 'users#new'
  post   '/signup',    to: 'users#create'
  get    '/login', 	   to: 'sessions#new'
  post   '/login',	   to: 'sessions#create'
  delete '/logout',	   to: 'sessions#destroy'
  resources :users
end
