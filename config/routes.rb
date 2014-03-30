HooverIsland::Application.routes.draw do
  root 'main#home'

  # Sessions
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/weather', to: 'main#weather'
end
