class SeedData

	attr_reader :urls, :keywords, :description, :headers, :text

	def initialize(urls, keywords, description, headers, text)
		@urls = urls
		@keywords = keywords
		@description = description
		@headers = headers
		@text = text
	end

	def store_in_csv(csv_file = 'seeddata.csv')
		csv_row = CSV.open(csv_file, 'ab') do |row|
			row << [@urls, @keywords, @description, @text]
		end
	end

end
