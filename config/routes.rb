Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :courses do
    resources :comments
    resources :questions, only: [:new, :create, :index, :show], shallow: true do
      resources :answers, only: [:new, :create]
    end
    collection do
      get :paid
      get :free
    end
    put :approve, on: :member
  end
  root 'courses#index'
end
