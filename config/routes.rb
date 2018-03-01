Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#about'

  get '/about', to: 'static_pages#about', as: 'about'
  get '/about/author', to: 'static_pages#author', as: 'author'
end
