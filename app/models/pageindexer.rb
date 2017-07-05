require_relative '../../stopwords.rb'

class PageIndexer

  attr_reader :page_indexed

  def initialize
    @page_indexed = Hash.new(0)
  end

  def indexing(content, keywords)
      exclude_stopwords(content).split(/\W/).each do |word|
        @page_indexed[word] += 1 if keywords.include?(word)
      end
      return Hash[@page_indexed.sort]
  end

private

  def exclude_stopwords(content)
    res = content.split(" ") - STOPWORDS
    p res
    return res.join(" ")
  end
end
