Rails.application.routes.draw do
  resources :fields

  resources :ensembles

  resources :instruments

  resources :students

  devise_for :users
  root to: "static#index"
end
