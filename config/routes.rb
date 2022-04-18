Rails.application.routes.draw do

  root to: 'tests#index'

  authenticate :user, lambda { |u| u.admin? } do
    root to: 'admin/tests#index', as: :admin_root
  end

  devise_for :users, path: 'guru', path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: "users/sessions" }
  resources :tests, only: :index do
    post 'start', on: :member
  end

  resources :test_passing, only: %i[show update] do
    get 'result', on: :member
    post 'save', on: :member
  end

  namespace :admin do
    get 'gists', to: 'gists#index'
    delete 'gists', to: 'gists#clear_gists'
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end
end
