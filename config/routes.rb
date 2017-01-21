Rails.application.routes.draw do
  get 'static_pages/home'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/events/:id/tickets', to: 'events#event_tickets'

  resources :events, :only => [:index, :new, :create, :update, :edit]
  resources :tickets
  resources :users

  root :to => "static_pages#home"
end
