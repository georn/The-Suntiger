test = { 
  url: {
      "www.bbc.co.uk"=> 1, "www.bbc.co.uk/sports"=> 2
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

class Ranker
attr_reader :word_score, :hash

  def initialize(hash, word)
    @hash = hash
    @word_score = 0
    @word = word
  end


  def calculate_total_score
    @hash.each do|k,v| 
      calculate_points_attribute(k, v, :url, 5)
      calculate_points_attribute(k, v, :keywords, 4)
      calculate_points_attribute(k, v, :description, 3)
      calculate_points_attribute(k, v, :headers, 2)
      calculate_points_attribute(k, v, :text, 1)
      end
    end

	private

  def calculate_points_attribute(k, v, attribute, points)
    if k == attribute 
        v.each do |key,value|
          @word_score += (points * value) if key.include?(@word)
        end
      end
  end
end

ranker = Ranker.new(test, "sports")
ranker.calculate_total_score
ranker.word_score
