Rails.application.routes.draw do

  resources :internationals

  root 'internationals#index'
  
  get	'/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/help',    to: 'static_pages#help'

  get 'friendships/create',  to: 'friendships#create'
  get 'friendships/destroy', to: 'friendships#destroy'

end
