Rails.application.routes.draw do
  root '/', controller: 'issues', action: :index
  get '/', controller: 'issues', action: :index

  resources :issues
  resources :comments, only: [:create]
  resources :tags, only: [:index, :show]
end
