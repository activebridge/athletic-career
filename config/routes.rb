Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :events, except: [:new, :index, :edit]
  scope ':type', constraints: { type: /past|future/ } do
    resources :events, only: [:new, :index], controller: 'events'
  end
  resources :welcome, only: :index, path: 'dashboard'
  resources :users
  resource :session, only: [:new, :destroy]
  resources :languages, only: :update, constraints: { id: /(ua|ru)/ }
  resources :competitions
  resources :lengths
  resources :articles, only: [:show, :index]

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :organizers
    resources :lengths
    resources :categories
    resources :events
    resources :users
    resources :articles
    get '/', to: 'dashboards#show', as: :dashboard
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
end
