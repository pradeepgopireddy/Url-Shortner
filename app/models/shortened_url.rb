class ShortenedUrl < ApplicationRecord
	belongs_to :user
	validate :check_long_url, on: :create
	validates_presence_of :original_url
	before_create :generate_short_url
	
	def generate_short_url
		url = [*('0'..'9'), *('A'..'Z'), *('a'..'z')].sample(8).join
		if ShortenedUrl.where(short_url: url).empty?
			self.short_url = url
		else
			self.generate_short_url
		end
	end
	def check_long_url
		url = ShortenedUrl.where(original_url: self.original_url)
		if url.empty?
		else
			errors.add(:base, "The url is already created")
		end
	end

end
