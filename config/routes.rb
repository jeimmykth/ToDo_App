Rails.application.routes.draw do
  root "to_do_lists#index"
  resources :tasks
  resources :to_do_lists
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
