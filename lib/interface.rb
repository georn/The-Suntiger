require 'csv'
# require_relative 'crawler'
require_relative 'ranking'
# require_relative 'pageindexer'

test_hash = { 
  id: 1,
  url: {
      "www.bbc.co.uk/news"=> 1, "www.bbc.co.uk/sports"=> 2
    },
    keywords: {
      "news"=> 2 , "sports"=> 5
    },
    description: {
      "bbc"=> 5 , "football"=> 7
    },

    headers: {
      "fire"=>1, "goal"=>4 
    },
    text: {
      "referee"=>2, "post"=> 5, "water"=>4, "eyes"=>3, "sports"=> 1
    }
  }


  test_hash_2 = {
  id: 2, 
  url: {
      "www.makersacademy.com"=> 1, "www.makersacademy.com/graduates"=> 2
    },
    keywords: {
      "course"=> 2 , "coding"=> 5
    },
    description: {
      "Makers"=> 5 , "code"=> 7
    },

    headers: {
      "Graduates"=>1, "Karin"=>4 
    },
    text: {
      "graduates"=>2, "code"=> 5, "backgrounds"=>4, "diversity"=>3, "career"=> 1, "goal"=> 1
   	}
  }

#gets input from User
puts "Enter search keyword"
query = gets.chomp
puts "You have entered: " + query

#creates Rankers, stores them in array
ranker1 = Ranker.new(test_hash, query)
ranker2 = Ranker.new(test_hash_2, query)
list =  [ranker1, ranker2]

#calculates total score for each ranker
ranker1.calculate_total_score
ranker2.calculate_total_score

#sorts list (highest score at top)
sorted_list =  list.sort_by do |ranker|
  -ranker.word_score
end

#returns info from CSV file relevant to seed in ranker
sorted_list.each do |ranker|
	CSV.foreach('seeddata.csv', col_sep: "|", quote_char: "|", headers: true) do |row|
		puts "#{row[1]} \n #{row[4]}" if row[0] == ranker.hash[:id].to_s
	end
end
