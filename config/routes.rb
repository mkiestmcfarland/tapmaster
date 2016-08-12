Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users

  resource :tap_list
end
