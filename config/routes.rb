Rails.application.routes.draw do


	root "shortened_urls#new"
	#get "/shortened_urls/index"
	resources :logs
	get "/shortened_urls/welcome"
	resources :shortened_urls
	get "/:short_url", to: "shortened_urls#show"
	devise_for :users
end
