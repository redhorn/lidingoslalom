Lidingoslalom::Application.routes.draw do
  get "static_pages/home"

  get "static_pages/help"

  resources :students

  resources :groups

  resources :users
end
