require 'csv'
require_relative 'page_indexer'

DATA_FILE = 'seeddata.csv'
COLUMN_SEPARATOR = '|'

class Indexer
  attr_reader :web_data

  def initialize
    @web_data = []
  end

  def process_csv(filename = DATA_FILE)
    CSV.foreach(DATA_FILE, col_sep: COLUMN_SEPARATOR, quote_char: "|", headers: true) do |row|
      page_indexer = PageIndexer.new(row)
      page_indexer.process_page
    end
  end
end

variable = Indexer.new
variable.process_csv
# variable.process_webs
# p variable.web_data.count
# variable.process_webs
# p storage
# filename = 'crawler_results.csv'
# col_sep = '|'
# i = 0
# Document = Struct.new :id, :url, :keyword, :body


# p __LINE__, web_search
#
# def general_indexing(data)
#   indexed_all = []
#   data.each do |data_line|
#     page = PageIndexer.new
#     indexed_all.push(page.indexing(data_line[3]))
#   end
#   indexed_all
# end
#
# p __LINE__, general_indexing(web_search)
