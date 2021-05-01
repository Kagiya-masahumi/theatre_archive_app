Rails.application.routes.draw do
  
  resources :performances,only:[:index]

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

  resources :groups, only:[:new, :create]
  resources :users, only:[:new, :create]

  

  
end
