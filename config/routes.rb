Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs do
    collection do
      post :confirm
    end
    member do
      patch :confirm
    end
  end
end
