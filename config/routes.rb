Rails.application.routes.draw do

  #Awards Routes
  get 'awards/:id', to: 'awards#student_view', as: 'awards_student'
  get 'awards', to: 'awards#index', as: 'awards'
  post 'student_ribbons/create_destroy', to: 'student_ribbons#create_destroy'
  post 'student_ribbons/create_destroy_issued_at', to: 'student_ribbons#create_destroy_issued_at'
  post 'student_offices/create_destroy', to: 'student_offices#create_destroy'
  post 'student_officer_ranks/create_update', to: 'student_officer_ranks#create_update'

  get 'awards/inventory/ribbon/:id', to: 'awards#inventory_ribbon', as: 'awards_inventory_ribbon'
  post 'awards/inventory/ribbon/:id', to: 'awards#inventory_ribbon_update', as: 'awards_inventory_ribbon_update'
  get 'awards/inventory/rank/:id', to: 'awards#inventory_rank', as: 'awards_inventory_rank'
  post 'awards/inventory/rank/:id', to: 'awards#inventory_rank_update', as: 'awards_inventory_rank_update'
  post 'awards', to: 'awards#search', as: 'awards_search'

  resources :officer_ranks, except: [:show, :destroy]

  get 'officer_ranks/permissions_error', to: 'officer_ranks#permissions_error'
  get 'offices/permissions_error', to: 'offices#permissions_error'
  get 'ribbons/permissions_error', to: 'ribbons#permissions_error'

  resources :offices, except: [:show, :destroy] do
    put :toggle_hidden
  end

  resources :ribbons, except: [:show, :destroy] do
    post :update_row_order, on: :collection
    put :toggle_hidden
  end

  resources :helps, except: [:show]

  put '/favorites/toggle', to: 'favorites#toggle_favorite', as: 'favorite_toggle'

  resources :announcements, except: [:show, :edit, :new, :update]

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

  get '/contact_types/permissions_error', to: 'contact_types#permissions_error', as: 'contact_types_permissions'
  resources :contact_types, except: [:show]

  get '/recruit_statuses/permissions_error', to: 'recruit_statuses#permissions_error', as: 'recruit_statuses_permissions'
  resources :recruit_statuses, except: [:show]

  get '/fields/permissions_error', to: 'fields#permissions_error', as: 'fields_permissions'
  resources :fields, except: [:show, :destroy] do
    post :update_row_order, on: :collection
    put :toggle_hidden
  end

  get '/ensembles/permissions_error', to: 'ensembles#permissions_error', as: 'ensembles_permissions'
  resources :ensembles, except: [:show]

  get '/instruments/permissions_error', to: 'instruments#permissions_error', as: 'instruments_permissions'
  resources :instruments, except: [:show]

  get 'students/unclaimed/', to: 'students#unclaimed', as: 'unclaimed_students'
  get 'students/import/', to: 'students#upload', as: 'import_students'
  post 'students/import_finalize/', to: 'students#import_finalize', as: 'import_students_confirm'
  get 'students/import/template', to: 'students#upload_template', as: 'upload_template'
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

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  devise_scope :user do
    get 'users/all', to: 'users/registrations#all_users', as: 'all_users'
    get 'users/new', to: 'users/registrations#generate_new', as: 'new_custom_user'
    get 'users/:id/ban', to: 'users/registrations#ban', as: 'toggle_banned_user'
    post 'users/new', to: 'users/registrations#create_new', as: 'save_custom_user'

    get 'users/:id/permissions', to: 'users/registrations#edit_permissions', as: 'edit_user_permissions'
    post 'users/:id/permissions', to: 'users/registrations#save_permissions', as: 'apply_custom_user_permissions'

    get 'users/:id/reset_password', to: 'users/registrations#reset_password', as: 'reset_user_password'
    get 'users/permission_error', to: 'users/registrations#permission_error', as: 'user_permission_error'
  end
  #devise_for :users
  get 'users/favorite_instruments/', to: 'favorite_instruments#user', as: 'user_favorite_instruments'
  post 'users/favorite_instruments/', to: 'favorite_instruments#create_multiple', as: 'create_multiple_user_favorite_instruments'

  get 'accountability', to: 'accountability#index', as: 'accountability'
  get 'accountability/:id', to: 'accountability#details', as: 'accountability_details'

  root to: "static#index"
end

