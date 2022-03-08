Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: 'guru', path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions" }
  resources :tests, only: :index do
    post 'start', on: :member
  end

  resources :test_passing, only: %i[show update] do
    get 'result', on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end
end
