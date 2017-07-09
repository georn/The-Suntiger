require 'csv'
require_relative 'crawler'
require_relative 'ranking'
require_relative 'indexer'

crawler = Crawler.new(['http://www.bbc.co.uk', 'http://www.makersacademy.com'])
crawler.fetch_data

indexer = Indexer.new
indexer.process_csv

#gets input from User
puts "Enter search keyword"
query = gets.downcase.chomp
puts "You have entered: " + query

list = []
#creates Rankers, stores them in array
indexer.page_hashes.each do |page_hash|
	ranker = Ranker.new(page_hash, query)
	ranker.calculate_total_score
	list << ranker
end

#sorts list (highest score at top)
sorted_list = list.sort_by do |ranker|
  #p ranker.hash
  p '----word score----'
  p -ranker.word_score
end

#returns info from CSV file relevant to seed in ranker
sorted_list.each do |ranker|
	CSV.foreach('seeddata.csv', col_sep: "|", quote_char: "|", headers: true) do |row|
    puts "#{row[1]} \n #{row[4]}" if row[0] == ranker.hash[:id].keys[0]
	end
end
