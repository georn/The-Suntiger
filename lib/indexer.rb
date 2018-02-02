require 'csv'
require_relative 'page_indexer'

DATA_FILE = 'seeddata.csv'
COLUMN_SEPARATOR = '|'

class Indexer
  attr_reader :web_data, :page_hashes

  def initialize
    @web_data = []
		@page_hashes = []
  end

  def process_csv(filename = DATA_FILE)
    CSV.foreach(DATA_FILE, col_sep: COLUMN_SEPARATOR, quote_char: "|", headers: true) do |row|
      page_indexer = PageIndexer.new(row)
      page_hash = page_indexer.process_page
			@page_hashes << page_hash
		end
  end
end

variable = Indexer.new
variable.process_csv
