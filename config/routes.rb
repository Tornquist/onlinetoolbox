Rails.application.routes.draw do
  resources :claimed_students

  get '/comments/new', to: 'comments#new', as: 'new_comment'
  post '/comments/', to: 'comments#create', as: 'comments'

  resources :contact_types

  resources :recruit_statuses

  resources :fields do
    post :update_row_order, on: :collection
    put :toggle_hidden
  end

  resources :ensembles

  resources :instruments

  resources :students do
    put :claim
    put :unclaim
  end

  devise_for :users
  root to: "static#index"
end
