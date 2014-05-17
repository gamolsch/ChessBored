RailsSkeleton::Application.routes.draw do

  root to: 'sessions#index'

  get '/game' => "game#index"

  post '/get_piece_info' => "game#get_piece_info"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
