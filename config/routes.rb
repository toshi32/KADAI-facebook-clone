Rails.application.routes.draw do
  # root 'users#new'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs, only: [:create, :new]
  resources :feeds do
    collection do
      post :confirm
    end
  end
end
