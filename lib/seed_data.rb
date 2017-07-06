class SeedData

	attr_reader :urls, :keywords, :description, :headers, :text

	def initialize(seed, urls, keywords, description, headers, text)
		@seed = seed
		@urls = urls
		@keywords = keywords
		@description = description
		@headers = headers
		@text = text
	end

	def store_in_csv(csv_file = 'seeddata.csv')
		csv_row = CSV.open(csv_file, 'ab', write_headers: true,
										headers: ["seed","urls","keywords", "description", "headers", "text"]) do |row|
			row << [@seed, @urls, @keywords, @description, @headers, @text]
		end
	end

end
