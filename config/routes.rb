Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, only: [:create, :edit, :update]
end
