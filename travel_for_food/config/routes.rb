Rails.application.routes.draw do



  root 'welcome#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'




  #resources :welcome, only: [:home], path_names: {new: 'home'}
  #resources :users, only: [:new, :create], path_names: {new: 'signup'}
  #resources :restaurants, only: [:index]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
