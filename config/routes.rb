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
  get '/trips',    to: 'main#trips'


  # People
  resources :people, only: [:index, :show, :edit, :update]

  # Reservation Requests
  resources :reservation_requests
end
