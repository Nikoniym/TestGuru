Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root to: 'tests#index'

  get :signup, to:  'users#new'
  get :login, to:  'sessions#new'
  get :exit, to: 'sessions#exit'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end
end
