Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :comments
  end
  root 'courses#index'
end
