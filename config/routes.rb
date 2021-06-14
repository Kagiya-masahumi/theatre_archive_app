Rails.application.routes.draw do
  

  resources :performances, only:[:index, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create,:destroy]
  end
  
    
  put 'performances/:id/edit', to: 'performances#update'
  get 'tags/:tag', to: 'performances#index', as: :tag

  root to: "performances#index"

  post 'favorite/:perform_id' => 'favorites#create', as: :create
  delete 'favorite/:perform_id' => 'favorites#destroy', as: :destroy

  
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
  resources :users do 
    get :favorites, on: :collection
  end
  
  
  resources :perform_steps,except:[:edit, :update] do
    collection do

      get 'step1'
      post 'step1' ,to: 'perform_steps#step1_validates'
      get 'step2'
      post 'step2',to: 'perform_steps#create'
      get 'done'          
    end
  end


  

  
end
