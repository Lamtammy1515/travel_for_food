Rails.application.routes.draw do



  root 'welcome#home'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

<<<<<<< HEAD
  
 get '/auth/github', :as => 'github_auth'
 get '/auth/:provider/callback', to: 'sessions#create'
=======

  get '/auth/:provider/callback', to: 'sessions#create'
 
  get '/auth/failure' => 'sessions#failure'
>>>>>>> cf66098562db38baa90e411c13a42298b12adde5

  get '/reviews/five_star' => 'reviews#five_star', as: :five_star

  get '/users/active_reviewer' => 'users#active_reviewer', as: :active_reviewer

  #resources :welcome, only: [:home], path_names: {new: 'home'}
  #resources :users, only: [:new, :create], path_names: {new: 'signup'}

  resources :locations, only: [:index, :show, :new, :create]  


  resources :restaurants, only: [:index, :show, :new, :create] do 
    resources :reviews, only: [:index, :show]
  end 

  resources :users, only: [:index, :new, :create, :show] do 
   resources :reviews
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
