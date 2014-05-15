RailsSkeleton::Application.routes.draw do
  get 'game/dashboard'

  get 'game/game'

  root to: 'sessions#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
