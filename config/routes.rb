Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :agendas
  
  resources :patients
  resources :user_specialties
  resources :specialties
  resources :attentions
  resources :ratings

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  get 'home/index'
  root 'home#index'
  get 'home/profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
