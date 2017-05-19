Rails.application.routes.draw do
	resources :businesses
  get 'orders/history', to: 'orders#history', as: 'history'
  get '/orders/shippers', to: 'orders#shippers', as: 'all_shippers'
	resources :orders
  resources :charges, only: [:new, :create]

  resources :boxes

  # Admins with devise and custom routes
  devise_for :admins, :controllers => {:registrations => 'registrations'}
  get '/admins/new', to: 'admins#admin_new', as: 'new_admin'
  post '/admins/new', to: 'admins#admin_create', as: 'create_admin'

# Shippers routes
 devise_for :shippers, :controllers => {:registrations => 'registrations'}
  get '/shippers/new', to: 'shippers#shipper_new', as: 'new_shipper'
  post '/shippers/new', to: 'shippers#shipper_create', as: 'create_shipper'

  devise_for :clients, :controllers => {:registrations => 'registrations'}
  get "/admins/dash" => "static_pages#admins_dash"
  root "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

