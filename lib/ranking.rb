class Ranker
attr_reader :word_score, :hash

  def initialize(hash, word)
    @hash = hash
    @word_score = 0
    @word = word
  end


  def calculate_total_score
    @hash.each do|key_hash, value_hash| 
      calculate_points_attribute(key_hash, value_hash, :urls, 5)
      calculate_points_attribute(key_hash, value_hash, :keywords, 4)
      calculate_points_attribute(key_hash, value_hash, :description, 3)
      calculate_points_attribute(key_hash, value_hash, :headers, 2)
      calculate_points_attribute(key_hash, value_hash, :text, 1)
      end
    end

	private

  def calculate_points_attribute(key_hash, value_hash, attribute, points)
    if key_hash == attribute 
        value_hash.each do |key_attr, value_attr|
          @word_score += (points * value_attr) if key_attr.include?(@word)
        end
      end
  end
end
