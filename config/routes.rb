Rails.application.routes.draw do
  resources :agendas
  resources :sessions
  resources :patients
  resources :user_specialties
  resources :specialties
  devise_for :users
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /d{4}/, :month => /d{1,2}/}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
