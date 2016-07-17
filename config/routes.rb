Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :events
  resources :welcome, only: :index, path: 'dashboard'
  resources :users
  resource :session, only: [:new, :destroy]
  resources :languages, only: :update, constraints: { id: /(ua|ru)/ }

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
end
