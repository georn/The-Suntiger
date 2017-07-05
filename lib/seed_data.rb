class SeedData

	attr_reader :urls, :keywords, :description, :text

	def initialize(urls, keywords, description, text)
		@urls = urls
		@keywords = keywords
		@description = description
		@text = text
	end


end
