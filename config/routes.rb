Lidingoslalom::Application.routes.draw do

  resources :groups do
    resources :practices
    resources :members
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :attendances

  root to: 'sessions#new'

  match 'groups/:id/actions', to: 'groups#actions'
  match 'groups/:group_id/register', to: 'practices#regindex'
  match 'groups/:group_id/practices/:practice_id/register', to: 'practices#register'

end
