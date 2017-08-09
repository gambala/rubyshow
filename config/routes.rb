# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :courses do
    resources :comments, except: %i(show edit new index)
    put :approve, on: :member
  end

  get '/opinions', to: 'comments#index', as: :comments
  get 'user/:id', to: 'users#show', as: :user
  get '/free', to: 'courses#free'
  get '/paid', to: 'courses#paid'
  get 'pages/home'

  root 'pages#home'
end
