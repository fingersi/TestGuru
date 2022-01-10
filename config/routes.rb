Rails.application.routes.draw do

  root 'tests#index'

  get 'sessions/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resource :sessions, only: :create
  resource :users, only: :create

  resources :tests do
    resources :questions, shallow: true
    post 'start', on: :member
  end

  resources :test_passing, only: %i[show update] do
    get 'result', on: :member
  end
end
