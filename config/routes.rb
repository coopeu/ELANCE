Rails.application.routes.draw do

  devise_for :users
	resources :gigs, :pages
	root 'gigs#index'

	get 'home', to: 'pages#index' 
	#get 'portfolio', to: 'pages#portfolio'
	get 'portfolio', to: :portfolio, controller: 'pages'
	get 'blog', to: :blog, controller: 'pages'
	get 'about', to: :about, controller: 'pages'
	get 'gigs', to: :index, controller: 'gigs'
	get 'gig', to: :show, controller: 'gigs'

end
