Rails.application.routes.draw do

  devise_for :users
	resources :gigs
	root 'gigs#index'
	resources :pages
	get 'home', to: 'pages#index' 
	#get 'portfolio', to: 'pages#portfolio'
	get 'portfolio', to: :portfolio, controller: 'pages'
	get 'blog', to: :blog, controller: 'pages'
	get 'about', to: :about, controller: 'pages'
end
