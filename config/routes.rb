Rails.application.routes.draw do
  get 'static_pages/home'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :events, :only => [:index, :new, :create]
  resources :tickets
  resources :users

  get '/', :to => redirect("static_pages#home")
  root :to => "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
