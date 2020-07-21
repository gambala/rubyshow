# frozen_string_literal: true

include RoutesHelper

Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount PgHero::Engine           , at: '/pghero'
    mount RailsPerformance::Engine , at: '/rails/performance' , as: 'rails_performance'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  get '/opinions', to: 'redirects#reviews'

  scope module: :web do
    resources :courses do
      resources :comments, only: %i(create update destroy)
      put :approve, on: :member
    end

    get 'user/:id', to: 'users#show', as: :user
    get '/free', to: 'courses#free'
    get '/paid', to: 'courses#paid'

    namespace :public, path: '' do
      resources :reviews, only: %i(index)
    end

    root to: 'welcome#index'
  end
end
