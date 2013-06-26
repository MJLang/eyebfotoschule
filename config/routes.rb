Eyebfotoschule::Application.routes.draw do
  
  # Login Stuff
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  delete "/logout" => 'sessions#destroy', as: 'logout'

  #Admin Space

  namespace :admin do
    get '/' => 'dashboard#index', as: 'dashboard'
  end
end
