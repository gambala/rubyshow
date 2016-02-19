Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  resources :courses do
    resources :comments
    post :graduate, on: :member
  end
  root 'courses#index'
end
