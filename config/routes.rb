HooverIsland::Application.routes.draw do
  root 'main#home'
  get '/weather', to: 'main#weather'
end
