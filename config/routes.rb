Lidingoslalom::Application.routes.draw do

  resources :members
  resources :groups
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'sessions#new'

  match 'groups/:id/actions', to: 'groups#actions'

end
