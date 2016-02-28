Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :courses do
    resources :comments
    collection do
      get :paid
      get :free
    end
  end
  root 'courses#index'
end
