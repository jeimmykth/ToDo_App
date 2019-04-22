Rails.application.routes.draw do
  root "to_do_lists#index"
  resources :to_do_lists do
    resources :tasks
    put '/tasks/:id/done', to: 'tasks#done', as: 'task_done'
  end
  devise_for :users
end
