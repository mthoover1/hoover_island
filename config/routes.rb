HooverIsland::Application.routes.draw do
  # Homepage
  root 'main#home'

  # Sessions
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Content
  get '/history',  to: 'main#history'
  get '/calendar', to: 'main#calendar'
  get '/weather',  to: 'main#weather'

  # People
  resources :people, only: [:index, :show, :edit, :update]
end
