Rails.application.routes.draw do
  resources :blogs
  # root 'users#new'
  resources :users, only: [:new, :create, :show]
  # resources :sessions, only: [:new, :create, :destroy]
  # resources :blogs do
  #   collection do
  #     post :confirm
  #   end
  # end
end
