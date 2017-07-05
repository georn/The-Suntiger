require 'csv'
require_relative 'pageindexer'

filename = 'crawler_results.csv'
web_search = []
col_sep = "|"
i = 0
Document = Struct.new :id, :url, :keyword, :body
web_search = File.read(filename).split("\n").map do |row|
  a = row.split(col_sep)
  i += 1
  a.unshift(i)
end
# p __LINE__, web_search
def indexing(data)
  indexed_all = []
  data.each do |data_line|
    page = PageIndexer.new
    indexed_all.push(page.page_indexing(data_line[3], data_line[2]))
  end
  return indexed_all
end
p __LINE__, indexing(web_search)
