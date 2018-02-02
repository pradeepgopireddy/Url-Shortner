Rails.application.routes.draw do


	root "shortened_urls#new"
	#get "/shortened_urls/index"
	
	resources :shortened_urls
	get "/:short_url", to: "shortened_urls#show"
	devise_for :users
end
