Rails.application.routes.draw do

  # Static Pages
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  # Spotify Calls
  get '/auth/spotify/callback', to: 'sessions#create'

  # Sessions Controller
  get   '/login',   to: 'sessions#create'
  #get    '/login',   to: 'sessions#new'
  #post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # Twilio Calls
  post 'sms/' => 'tracks#create'

  get 'playlists/create'
  get 'tracks/create'
  post 'playlists/activate'



  resources :users
  resources :playlists
  resources :tracks
  # ,          only: [:create, :destroy]
end
