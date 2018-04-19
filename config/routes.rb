Rails.application.routes.draw do
  devise_for :users
  resources :patients do
    resources :records
    resources :appointments
  end
  root 'patients#index'
end
