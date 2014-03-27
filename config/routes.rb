TenInNine::Application.routes.draw do
  root 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'  
  delete 'sessions/destroy', to: 'sessions#destroy', as: 'logout'

  resources :projects

  get 'users/:id', to: 'users#show', as: 'user' 
end
