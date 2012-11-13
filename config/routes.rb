Lidingoslalom::Application.routes.draw do

  resources :groups do
    resources :practices
    resources :members
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'sessions#new'

  match 'groups/:id/actions', to: 'groups#actions'

end
