RailsSkeleton::Application.routes.draw do

  get 'game/game'

  root to: 'sessions#index'

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  # CODE REVIEW: Do I get an information telling me the auth has failed
  # when I'm redirected to auth/failure?
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
