Rails.application.routes.draw do

  resources :users do
    resources :posts
  end
  resources :prompts do
    resources :posts
  end

  get "/", to: "movies#from_db"
  get "/random", to: 'movies#random'#generate random prompt
  get "/save_random", to: 'movies#save_random'

  get "/about", to: "pages#show", as: "about"
  get "/contact", to: "pages#contact", as: "contact"


  put '/vote' => 'posts#vote'
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
