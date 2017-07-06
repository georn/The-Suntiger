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
		csv = CSV.open(csv_file, 'a+', col_sep: "|", quote_char: "|") do |row|
			row << [@seed, @urls, @keywords, @description, @headers, @text]
			p @urls

		end
	end

	# def store_in_csv(csv_file = 'seeddata.csv')
	# 	string_csv = CSV.generate do |csv|
	# 		csv << [@seed, @urls, @keywords, @description, @headers, @text]
	# 	end
	# end

	# parsed_csv = CSV.parse(File.read('./seeddata.csv'), headers: true)
	# p parsed_csv.class
	# p parsed_csv
	# parsed_csv.each do |row|
	# 	p row.class
	# 	p row['urls']
	# end

end
