Lidingoslalom::Application.routes.draw do

  resources :groups do
    resources :practices
    resources :members
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :attendances
  resources :messages

  root to: 'sessions#new'

  match '/signout', to: "sessions#destroy", via: :delete
  match 'sessions', to: "sessions#new"
  match 'groups/:id/actions', to: 'groups#actions'
  match 'groups/:id/export', to: 'groups#export'
  match 'groups/:group_id/register', to: 'practices#regindex'
  match 'groups/:group_id/practices/:practice_id/register', to: 'practices#register'

end
