Rails.application.routes.draw do
  devise_for :users
  resources :comments
  resources :courses
  root 'courses#index'
end
