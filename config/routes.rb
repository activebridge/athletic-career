Rails.application.routes.draw do
  resources :events
  root to: 'welcome#index'
  resources :welcome, only: :index, path: 'dashboard'
  resources :users
  resource :session, only: [:new, :destroy]
  get '/auth/:provider/callback', to: 'sessions#create'
end
