Rails.application.routes.draw do
  resources :post_attachments
  resources :posts
  root 'homes#index'
  resources :photos do
    resources :tags
    resources :search_count
  end
  devise_for :users
end
