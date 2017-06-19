Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/" => "sessions#index", as: 'root'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'

  delete '/logout' => 'sessions#destroy', as: 'logout'

  get '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new', as: 'signup'

  resources :guests#, only: [:index]
  resources :episodes#, only: [:index]


end
