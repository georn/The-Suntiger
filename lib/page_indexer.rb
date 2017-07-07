require_relative '../stopwords.rb'

CSV_DATA_HEADERS = [:id, :seed, :urls, :keywords, :description, :headers, :text]

class PageIndexer
  attr_reader :page_indexed

  def initialize(page)
    @page = page
    @page_hash = Hash.new(0)
    @word_count_hash = Hash.new(0)
  end

  def process_page
    CSV_DATA_HEADERS.each_with_index do |csv_header, index|
      @page_hash[csv_header] = indexing_column(@page[index])
    end
     p @page_hash
  end

  def indexing_column(column)
    exclude_stopwords(column).each do |word|
      @word_count_hash[word] += 1
    end
    Hash[@word_count_hash.sort]
  end

  private

  def exclude_stopwords(content_section)
    return Hash.new(0) if content_section == "0"
    clean_section = content_section.downcase.split(' ') - STOPWORDS
    return clean_section
  end

  def save_JSON
  end
end
