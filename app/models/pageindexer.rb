class PageIndexer

  attr_reader :page_indexed

  def initialize
    @page_indexed = Hash.new(0)
  end

  def indexing(content, keywords)
      content.split(/\W/).each do |word|
        @page_indexed[word] += 1 if keywords.include?(word)
      end
      return Hash[@page_indexed.sort]
  end
end
