Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles #Exposes all routes for articles and the rest of teh restful routes.
  #resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy] #This will expose only the routes listed for articels
end
