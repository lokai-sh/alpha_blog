Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'
  #resources :articles, only: [:show]
  resources :articles, only: [:show, :new, :create, :index]
end
