class ShortenedUrlsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :index]
	def new
		@url = ShortenedUrl.new
	end
	def index
		@urls = current_user.shortened_urls
		@url = ShortenedUrl.new
	end
	
	def show
		@url = ShortenedUrl.find_by_short_url(params[:short_url])
		log_creation(@url)
		@url.update_attributes(:clicks => @url.clicks + 1)
		redirect_to @url.original_url
	end

	def create
		@url = ShortenedUrl.new(shortened_url_params)
		@url.user_id = current_user.id

		if @url.save
			
			redirect_to shortened_urls_path
		else
			render action: 'new'
		end
		
	end
	def edit
		@url = ShortenedUrl.find(params[:id])
	end
	def update
		@url = ShortenedUrl.find(params[:id])
		if @url.update_attributes(shortened_url_params)
			redirect_to shortened_urls_path, notice: "Successfully updated the url"
		else
			render action: 'edit'
		end
	end
	def destroy
		@url = ShortenedUrl.find(params[:id])
		@url.destroy
		redirect_to shortened_urls_path, notice: "Successfully destroyed the url"
	end
	def welcome
		@url = ShortenedUrl.find_by(:url_id)
	end
	
	private
	def shortened_url_params
		params[:shortened_url].permit(:original_url, :clicks, :short_url, :user_id)
	end
	def log_creation(url)
		@log = Log.new(shortened_url_id: url.id, browser_name: browser.name, operating_system: browser.platform.name, device_name: browser.device.name, user_id: current_user.id )
			@log.save
	end
end
