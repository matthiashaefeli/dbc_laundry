Rails.application.routes.draw do
	resources :businesses
	resources :orders
  devise_for :shippers
  devise_for :clients
  devise_for :admins

  root "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

