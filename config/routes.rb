Eyebfotoschule::Application.routes.draw do
  
  get "courses/index"
  get "courses/new"
  get "courses/edit"
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
    resources :posts
    resources :courses do
      resources :assets
      resources :timeframes
      resources :prices
      resources :course_dates

      resource :tile, only: [:edit, :update]
      collection do
        post 'sort'
      end
    end
  end

  resource :messages, only: [:show, :create, :destroy]
  resources :courses, only: [:index, :show, :book] do
    resource :bookings
  end

  root to: 'sites#home'  
end
