Rails.application.routes.draw do

	devise_for :users
	resources :pages
	resources :contacts, only: [:new, :create]

  resources :posts do
  	resources :comments, except: [:index], controller: 'posts/comments'
	end
  
  resources :gigs do 
		resources :proposals, except: [:index]
		collection do
			get :search
		end
	end

	root 'gigs#index'

	get 'home', to: 'pages#home' 
	get 'contacts', to: 'contacts#create'
	get 'blog', to: :blog, controller: 'pages'
	get 'portfolio', to: :portfolio, controller: 'pages'
	get 'about', to: :about, controller: 'pages'
	get 'gigs', to: :index, controller: 'gigs'
	get 'gig', to: :show, controller: 'gigs'
	get 'advsearch', to: :advsearch, controller: 'gigs'

end
