Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get '/opinions', to: 'comments#index', as: :comments
  resources :courses do
    resources :comments, except: [:show, :edit, :new, :index]
    put :approve, on: :member
  end
  root 'courses#index'
end
