Rails.application.routes.draw do
  root 'homes#index'
  resources :photos do
    resources :tags
    resources :search_count
  end
  devise_for :users
end
