Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments, only: [:index, :show, :new, :create, :edit, :update] do
    resources :bookings, only: [:create, :new, :create, :edit, :update, :destroy]
    resources :reviews, only: [:create]
  end
  resources :instruments, only: [:destroy]
  resources :bookings, only: [:show]
  resources :review, only: [:destroy]
end
