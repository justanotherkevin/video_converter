Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :videos
  resources :ffmpegs, only: [:show, :create]
  root "videos#new"
end
