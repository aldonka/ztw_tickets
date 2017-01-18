Rails.application.routes.draw do
  get 'users/show'

  get '/signup', to: 'users#new'

  resources :events, :only => [:index, :new, :create]
  resources :tickets
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
