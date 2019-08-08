Rails.application.routes.draw do

  	devise_for :users
	root to: 'restaurants#landing'
	resources :reviews
	resources :restaurants

end