Rails.application.routes.draw do

  resources :internationals

  root 'internationals#index'
end
