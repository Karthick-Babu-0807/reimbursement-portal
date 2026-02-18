Rails.application.routes.draw do
  root "sessions#new"

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :employees

  resources :bills do
    member do
      patch :approve
      patch :reject
    end
  end
end
