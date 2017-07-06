require 'csv'

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
		csv = CSV.open(csv_file, 'a+', col_sep: "|") do |row|
			row << [@seed, @urls, @keywords, @description, @headers, @text]
		end
	end

end
