Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: 'guru', path_names: { sign_in: :login, sign_out: :logout }

  resources :tests do
    resources :questions, shallow: true
    post 'start', on: :member
  end

  resources :test_passing, only: %i[show update] do
    get 'result', on: :member
  end
end
