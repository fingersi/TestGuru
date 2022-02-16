Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: 'guru', path_names: { sign_in: :login, sign_out: :logout }
  get 'guru/complete_form', to: 'users#complete_form'
  post 'guru/complete_form', to: 'users#update'
  resources :tests, only: :index do
    post 'start', on: :member
  end

  resources :test_passing, only: %i[show update] do
    get 'result', on: :member
  end

  namespace :admin do
    root 'tests/#index'
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end
end
