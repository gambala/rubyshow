Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :comments
    post :graduate, on: :member
  end
  root 'courses#index'
end
