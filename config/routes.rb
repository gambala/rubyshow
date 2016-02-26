Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :courses do
    resources :comments
    post :graduate, on: :member
  end
  root 'courses#index'
end
