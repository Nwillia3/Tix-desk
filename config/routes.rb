Rails.application.routes.draw do
  resources :tixes
  devise_for :users


  root 'tixes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
