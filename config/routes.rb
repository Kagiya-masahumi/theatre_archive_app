Rails.application.routes.draw do
  

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
  #resources :comments

  resources :perform_steps ,only: [:index,:create] do
    collection do

      get 'registration'
      post 'registration' => 'perform_steps#first_validation'
      get 'company'
      post 'company' => 'perform_steps#second_validation'
      get 'done'          
    end
  end


  

  
end
