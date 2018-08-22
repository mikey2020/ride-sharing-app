Rails.application.routes.draw do

  devise_for :users
  get 'welcome/index'

  resources :interests

  resources :rides

  root 'rides#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
