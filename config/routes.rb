HooverIsland::Application.routes.draw do
  # Homepage
  root 'main#home'

  # Sessions
  get    '/login',           to: 'sessions#new'
  post   '/login',           to: 'sessions#create'
  delete '/logout',          to: 'sessions#destroy'
  get    '/forgot_password', to: 'sessions#password'
  post   '/forgot_password', to: 'sessions#send_password_email'

  # Content
  get '/history',  to: 'main#history'
  get '/calendar', to: 'main#calendar'
  get '/weather',  to: 'main#weather'
  get '/finances', to: 'main#finances'

  # Admin
  get '/admin',    to: 'admin#dashboard'
  post '/accept_request', to: 'admin#accept_request', as: 'accept_request'
  post '/flag_request',   to: 'admin#flag_request',   as: 'flag_request'
  post '/deny_request',   to: 'admin#deny_request',   as: 'deny_request'

  # People
  resources :people, only: [:index, :show, :edit, :update]

  # Reservation Requests
  resources :reservation_requests
end
