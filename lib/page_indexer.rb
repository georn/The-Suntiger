require_relative '../stopwords.rb'

class PageIndexer
  attr_reader :page_indexed

  def initialize
    @page_indexed = Hash.new(0)
  end

  def indexing(content)
    exclude_stopwords(content).each do |word|
      @page_indexed[word] += 1
    end
    Hash[@page_indexed.sort]
  end

  private

  def exclude_stopwords(content)
    content.split(' ') - STOPWORDS
  end
end
