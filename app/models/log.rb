class Log < ApplicationRecord
	belongs_to :shortened_url
	belongs_to :user
	validates_presence_of :shortened_url_id, :browser_name, :operating_system, :device_name, :user_id
end
