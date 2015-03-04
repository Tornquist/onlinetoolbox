Rails.application.routes.draw do

  resources :seasons, except: [:destroy] do
    resources :students, only: [] do
      resources :scores, except: [:destroy, :show]
      resources :gds, except: :show
      get '/gigs/', to: 'gigs#student_view'
    end
    resources :gigs, except: :show
    get '/recruitment/', to: 'seasons#recruitment'
    get '/gds/', to: 'seasons#gds'
  end

  resources :rank_members, only: [:index, :show, :update, :create]

  #resources :ranks

  #resources :section_notes

  #resources :section_members

  get 'sections/:id/notes', to: 'section_notes#notes', as: 'section_notes'
  post 'sections/:id/notes', to: 'section_notes#create'

  resources :sections, except: [:index, :destroy] do
    get '/transfer/', to: 'sections#transfer'
    post '/transfer_students/', to: 'sections#transfer_students'
  end

  #resources :games

  #resources :claimed_students

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

  get 'students/unclaimed/', to: 'students#unclaimed', as: 'unclaimed_students'
  get 'students/import/', to: 'students#upload', as: 'import_students'
  get 'students/import_finalize/', to: 'students#import_finalize', as: 'import_students_confirm'
  get 'students/search/', to: 'students#search', as: 'search_students'
  post 'students/search/', to: 'students#search_terms', as: 'search_students_terms'
  resources :students, except: :destroy do
    put :claim
    put :unclaim
    delete :archive
    put :unarchive
    collection { post :import }
    get :sections, on: :member
  end

  devise_for :users
  get 'users/favorite_instruments/', to: 'favorite_instruments#user', as: 'user_favorite_instruments'
  post 'users/favorite_instruments/', to: 'favorite_instruments#create_multiple', as: 'create_multiple_user_favorite_instruments'

  root to: "static#index"
end
