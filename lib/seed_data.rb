class SeedData

	attr_reader :urls, :keywords, :description, :headers, :text

	def initialize(urls, keywords, description, headers, text)
		@urls = urls
		@keywords = keywords
		@description = description
		@headers = headers
		@text = text
	end


end
