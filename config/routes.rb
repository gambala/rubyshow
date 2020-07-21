# frozen_string_literal: true

include RoutesHelper

Rails.application.routes.draw do
  authenticate :user, ->(user) { user.admin? } do
    mount PgHero::Engine           , at: '/pghero'
    mount RailsPerformance::Engine , at: '/rails/performance' , as: 'rails_performance'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope module: :web do
    resources :courses do
      resources :comments, except: %i(show edit new index)
      put :approve, on: :member
    end

    get '/opinions', to: 'comments#index', as: :comments
    get 'user/:id', to: 'users#show', as: :user
    get '/free', to: 'courses#free'
    get '/paid', to: 'courses#paid'

    root to: 'welcome#index'
  end
end
