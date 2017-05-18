Rails.application.routes.draw do
	resources :businesses
	resources :orders
  resources :charges, only: [:new, :create]



 # Admins with devise and custom routes
  devise_for :admins, :controllers => {:registration => 'registrations'}
  get '/admins/new', to: 'admins#admin_new', as: 'new_admin'
  post '/admins/new', to: 'admins#admin_create', as: 'create_admin'

# Shippers routes
 devise_for :shippers, :controllers => {:registration => 'registrations'}
  get '/shippers/new', to: 'shippers#shipper_new', as: 'new_shipper'
  post '/shippers/new', to: 'shippers#shipper_create', as: 'create_shipper'

  devise_for :clients
  get "/admins/dash" => "static_pages#admins_dash"
  root "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

