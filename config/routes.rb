Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :patients
  resources :user_specialties
  resources :specialties
  resources :attentions
  resources :ratings
  scope :profiles do
    resources :users do
      resources :schedule_events, on: :member
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  get 'home/index'
  root 'home#index'
  get 'home/profile'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
