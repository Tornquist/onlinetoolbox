Rails.application.routes.draw do
  resources :comments

  resources :contact_types

  resources :recruit_statuses

  resources :fields

  resources :ensembles

  resources :instruments

  resources :students

  devise_for :users
  root to: "static#index"
end
