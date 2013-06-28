Eyebfotoschule::Application.routes.draw do
  
  #Site Controller

  get "/kontakt" => "sites#contact", as: "contact"
  get '/info' => "sites#about", as: 'about'

  # Login Stuff
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete "/logout" => 'sessions#destroy', as: 'logout'

  #Admin Space

  namespace :admin do
    get '/' => 'dashboard#index', as: 'dashboard'
  end

  resource :messages, only: [:show, :create, :destroy]

  root to: 'sites#home'  
end
