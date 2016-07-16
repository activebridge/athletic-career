Rails.application.routes.draw do
  root to: 'welcome#index'
  resources :welcome, only: :index, path: 'dashboard'
  resources :users
  resource :session, only: [:new, :destroy]
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/vkontakte', to: 'sessions#create'
end
