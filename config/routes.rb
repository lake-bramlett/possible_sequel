Rails.application.routes.draw do

  resources :users do
    resources :posts
  end
  resources :prompts do
    resources :posts
  end

  get "/", to: "movies#from_db"
  get "/random", to: 'prompts#random'#generate random prompt
  get "/about", to: "pages#show", as: "about"
  get "/contact", to: "pages#contact", as: "contact"


  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end
