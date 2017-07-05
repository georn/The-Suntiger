class PageIndexer

  attr_reader :page_indexed

  def initialize
    @page_indexed = Hash.new(0)
  end

  def page_indexing(content, keyword)
      content.split(/\W/).each do |word|
        @page_indexed[word] += 1 if word == keyword
      end
      return @page_indexed
  end
end
