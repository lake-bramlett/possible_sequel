Rails.application.routes.draw do
  
  resources :users do
    resources :posts
  end
  resources :prompts do
    resources :posts
  end

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
