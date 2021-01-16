Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :agendas
  resources :sessions
  resources :patients
  resources :user_specialties
  resources :specialties
  #devise_for :users
  root to: "sessions#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
