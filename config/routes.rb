Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'
  resources :categories
  resources :expenses

  unauthenticated do
    root 'home#index'
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
