Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get '/opinions', to: 'comments#index', as: :comments
  get 'user/:id', to: 'users#show', as: :user
  resources :courses do
    resources :comments, except: [:show, :edit, :new, :index]
    put :approve, on: :member
  end

  get '/free', to: 'courses#free'
  get '/paid', to: 'courses#paid'
  get 'pages/home'

  root 'pages#home'
end
