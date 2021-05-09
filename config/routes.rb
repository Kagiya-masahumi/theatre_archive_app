Rails.application.routes.draw do
  

  get 'tops/index'
  get 'tops/new'
  get 'tops/create'
  resources :performances

  root to: "performances#index"
  
  devise_for :groups, controllers: {
    sessions:      'groups/sessions',
    passwords:     'groups/passwords',
    registrations: 'groups/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  resources :groups
  resources :users
  resources :tops

  

  
end
