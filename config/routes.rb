Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :projects
  resources :users, only: [:index, :new, :creata, :edit, :update, :destroy]
  
end
