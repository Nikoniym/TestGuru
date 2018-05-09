Rails.application.routes.draw do
  devise_for :users, path: :gurus,
                     path_names: {sign_in: :login, sign_out: :logout}

  root to: 'tests#index'

  resources :feedbacks, only: %i[new create]

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
    post :gist, on: :member
  end

  resources :badges, only: :index

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :badges
    resources :gists, only: :index
  end
end
