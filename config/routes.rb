Rails.application.routes.draw do
  root 'homes#index'
  resources :photos do
    resources :tags
  end
  devise_for :users
end
