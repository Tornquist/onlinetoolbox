Rails.application.routes.draw do
  resources :claimed_students

  get '/comments/new', to: 'comments#new', as: 'new_comment'
  post '/comments/', to: 'comments#create', as: 'comments'

  resources :contact_types

  resources :recruit_statuses

  resources :fields

  resources :ensembles

  resources :instruments

  resources :students

  devise_for :users
  root to: "static#index"
end
