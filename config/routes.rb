Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#new"
  get '/logout' => 'sessions#destroy'
  get '/comments/like/:comment_id/:event_id' => 'comments#like'
  post 'login' => 'sessions#create'
  get '/login' => 'sessions#new'
  get 'signup'  => 'users#new'
  get "/events/enroll/:id" => 'events#enroll'
  get "/events/filter/:category" => "events#filter"

  resources :users do 
    resources :events
    resources :comments
  end
end
