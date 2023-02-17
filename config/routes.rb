Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#new"
  get '/logout' => 'sessions#destroy'
  post 'login' => 'sessions#create'
  get '/login' => 'sessions#new'
  get 'signup'  => 'users#new'
  get "/events/enroll/:id" => 'events#enroll'
  resources :users do 
    resources :events
  end
end
