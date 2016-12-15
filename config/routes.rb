Rails.application.routes.draw do
 
	resources :users, except: [:destroy] 
	resources :sessions, only: [:create, :destroy]
	resources :products
	root 'users#index'
end
