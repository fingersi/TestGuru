Rails.application.routes.draw do
  resources :tests do
    resources :questions, shallow: true
    post 'start', on: :member
  end

  resources :test_passing, only: %i[show update] do
    get 'result', on: :member
  end
end
