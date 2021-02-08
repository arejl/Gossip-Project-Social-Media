Rails.application.routes.draw do
  get 'gossips/:id', to: 'gossips#id'
  get 'welcome/:user_name', to: 'users#welcome'
  get 'users/:user_id', to: 'users#profile'
  root 'static_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
end
