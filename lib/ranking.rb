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
attr_reader :word_score

  def initialize(hash, word)
    @hash = hash
    @word_score = 0
    @word = word
  end


  def score
    @hash.each do|k,v| 
      calculate_points(k, v, :url, 5)
      calculate_points(k, v, :keywords, 4)
      calculate_points(k, v, :description, 3)
      calculate_points(k, v, :headers, 2)
      calculate_points(k, v, :text, 1)
      end
    end

  def calculate_points(k, v, attribute, points)
    if k == attribute 
        v.each do |key,value|
          p key
          @word_score += (points * value) if key.include?(@word)
        end
        '-----1-----'
        p @word_score
      end
  end
end

ranker = Ranker.new(test, "sports")
ranker.score
ranker.word_score
