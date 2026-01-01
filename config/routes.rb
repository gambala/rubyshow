include RailsPlus::Helpers::Routes

Rails.application.routes.draw do
  get "up", to: "rails/health#show", as: :rails_health_check

  authenticate :user, ->(user) { user.admin? } do
    mount Motor::Admin => '/motor_admin'
    mount RailsPerformance::Engine, at: "/rails/performance", as: "rails_performance"
  end

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}

  get "/opinions", to: "redirects#reviews"

  scope module: :web do
    get "/courses/free", to: redirect("/courses?paid=0")
    get "/courses/paid", to: redirect("/courses?paid=1")
    get "/free", to: redirect("/courses?paid=0")
    get "/paid", to: redirect("/courses?paid=1")

    resources :courses do
      resources :comments, only: %i[index create update destroy]
      put :approve, on: :member
    end

    get "user/:id", to: "users#show", as: :user

    namespace :public, path: "" do
      resources :reviews, only: %i[index]
    end

    root to: "welcome#index"
  end
end
