Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :events, except: [:new, :index, :edit]
  scope ':type', constraints: { type: /past|future/ } do
    resources :events, only: [:new, :index], controller: 'events'
  end
  resources :welcome, only: :index, path: 'dashboard'
  resources :users, except: :destroy
  resource :session, only: [:new, :destroy]
  resources :languages, only: :update, constraints: { id: /(ua|ru)/ }
  resources :competitions
  resource :personal_best, except: :show
  resources :lengths
  resources :articles, only: [:show, :index]

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :banners
    resources :organizers
    resources :lengths
    resources :categories
    scope ':type', constraints: { type: /past|future/ } do
      resources :events do
        resource :distance
      end
    end
    resources :users
    resources :articles
    get '/', to: 'dashboards#show', as: :dashboard
  end

  namespace :organizer do
    get '/', to: 'dashboards#show', as: :dashboard
    resources :members
    resources :sm_links, except: :show
    scope ':type', constraints: { type: /past|future/ } do
      resources :events do
        resource :distance
      end
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get ':page', to: 'page#show', as: :page, constraints: { page: /(useful_links)/ }
end
