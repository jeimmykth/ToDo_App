Rails.application.routes.draw do
  root "to_do_lists#index"
  resources :to_do_lists do
    resources :tasks
  end
  devise_for :users
end
