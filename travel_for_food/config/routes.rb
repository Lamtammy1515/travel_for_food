Rails.application.routes.draw do



  root 'welcome#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'





  #resources :welcome, only: [:home], path_names: {new: 'home'}
  #resources :users, only: [:new, :create], path_names: {new: 'signup'}

  resources :locations, only: [:index, :new, :create] 
  resources :restaurants, only: [:index, :new, :create] 
  
  resources :users, only: [:index, :new, :create, :show] do 
   resources :reviews, only: [:index, :show, :new, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
