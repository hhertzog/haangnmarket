Rails.application.routes.draw do
  get 'notifications/index'
  delete 'notifications/index', to:'notifications#delete_all'
  delete 'home/index', to:'home#delete_all_user_posts'
  delete 'keywords/index', to:'keywords#delete_all_user_keywords'
  resources :posts
  resources :keywords
  devise_for :users
  root 'home#index'
  get 'home/my_posts'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
