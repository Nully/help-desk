Rails.application.routes.draw do
  root '/', controller: 'issues', action: :index
  get '/', controller: 'issues', action: :index

  resources :issues
end
