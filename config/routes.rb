Rails.application.routes.draw do
  resources :posts
  resources :keywords
  devise_for :users
  root 'home#index'
  get 'home/my_posts'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
