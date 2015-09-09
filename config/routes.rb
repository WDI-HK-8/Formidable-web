Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth'
  root 'static_pages#index'

  post 'users/:user_id/forms', to: 'forms#create'
  get 'users/:user_id/forms', to: 'forms#index'
  resources :forms, only: [:destroy, :show, :update]

  post '/forms/:form_id/submissions', to: 'submissions#create'
  get '/forms/:form_id/submissions', to: 'submissions#index'
  resources :submissions, only: [:destroy, :show, :update]

  post '/forms/:form_id/contents', to: 'contents#create'
  get '/forms/:form_id/contents', to: 'contents#index'
  resources :contents, only: [:destroy, :show, :update]

  post '/contents/:content_id/answers', to: 'answers#create'
end
