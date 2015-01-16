Rails.application.routes.draw do
  resources :fields

  resources :groups

  resources :options

  resources :texts

  resources :states

  resources :addresses

  resources :student_instruments

  resources :ensembles

  resources :instruments

  resources :students

  devise_for :users
  root to: "static#index"
end
