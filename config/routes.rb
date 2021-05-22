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

  resources :perform_steps do
    collection do

      get 'step1'
      post 'step1' ,to: 'perform_steps#step1_validation'
      get 'step2'
      post 'step2',to: 'perform_steps#step2_validation'
      get 'done'          
    end
  end


  

  
end
