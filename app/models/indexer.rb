require 'csv'
require 'fileutils'
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
  data.each_with_index do |data_line, i|
    indexed_page = Hash.new(0)
    data_line[3].split(/\W/).each do |word|
      indexed_page[word] += 1 if word == data_line[2]
    end
    # p __LINE__, indexed_page
    indexed_all.push(indexed_page)
  end
  return indexed_all
end
p __LINE__, indexing(web_search)
