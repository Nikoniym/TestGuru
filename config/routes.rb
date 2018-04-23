Rails.application.routes.draw do
  devise_for :users, path: :gurus,
                     path_names: {sign_in: :login, sign_out: :logout}

  root to: 'tests#index'

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
  end
end
