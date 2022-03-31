Rails.application.routes.draw do
  root 'static_pages#home'
  get    '/help',     to: 'static_pages#help'
  get    '/friends',  to: 'static_pages#friends'
  get    '/contact',  to: 'static_pages#contact'
  get    '/signup',   to: 'users#new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  get    '/logout',   to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :items
  resources :relationships, only: [:create, :destroy]
end
