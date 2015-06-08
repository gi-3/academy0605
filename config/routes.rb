Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users

  resources :entlies, only: [:new, :create, :update, :edit, :destroy]

  resources :users do
    resources :entlies, only: [:show]
  end

end
