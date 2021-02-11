Rails.application.routes.draw do
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :gossips do
    resources :comments
  end
  resources :users
  get 'welcome/:user_name', to: 'users#welcome'
  resources :cities
  resources :sessions
end
