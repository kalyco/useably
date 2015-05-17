Rails.application.routes.draw do
  root 'homes#index'
  resources :photos
  devise_for :users
end
