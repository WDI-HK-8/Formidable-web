Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth'
  root 'static_pages#index'

  resources :forms

  post '/forms/:form_id/submissions', to: 'submissions#create'
  get '/forms/:form_id/submissions', to: 'submissions#index'
  resources :submissions

  post '/forms/:form_id/contents', to: 'contents#create'
  get '/forms/:form_id/contents', to: 'contents#index'
  resources :contents

  post '/contents/:content_id/answers', to: 'answers#create'
end
