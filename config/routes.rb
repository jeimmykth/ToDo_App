Rails.application.routes.draw do
  resources :tasks
  root to:"to_do_lists#index"
  resources :to_do_lists
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
