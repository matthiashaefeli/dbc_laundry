Rails.application.routes.draw do
	resources :buisnesses

  devise_for :shippers
  devise_for :clients
  devise_for :admins
  get "/admins/dash" => "static_pages#admins_dash"
  root "application#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

