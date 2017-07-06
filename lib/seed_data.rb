require 'csv'

class SeedData

	attr_reader :urls, :keywords, :description, :headers, :text

	def initialize(id, seed, urls, keywords, description, headers, text)
		@id = id
		@seed = seed
		@urls = urls
		@keywords = keywords
		@description = description
		@headers = headers
		@text = text
	end

	def store_in_csv(csv_file = 'seeddata.csv')
		csv = CSV.open(csv_file, 'a+', col_sep: "|", quote_char: "|") do |row|
			row << [@id, @seed, @urls, @keywords, @description, @headers, @text]
		end
	end

end
