# require 'indexer'
require 'csv'
require 'page_indexer'

describe PageIndexer do
  csv =  __dir__ + '/page_indexer_test.csv'

	CSV.foreach(csv, col_sep: "|", quote_char: "|", headers: true) do |row|
  	let(:page_indexer) { PageIndexer.new(row) }
	end
	
  it "exists" do
    expect(page_indexer).to be_truthy
  end

  it "it initializes with a new hash" do
    expect(page_indexer.page_indexed).to be_empty
  end

  it "indexes pages content by counting frequency of words" do
    content = "and the raven raven never flitting still is sitting still is never sitting"
    expect(page_indexer.indexing(content)).to eq({"flitting"=>1, "raven"=>2, "sitting"=>2})
  end

  it "indexes pages content by counting frequency of words with stop words excluded" do
    content = "and the raven raven never flitting still is sitting still is never sitting"
    expect(page_indexer.indexing(content)).not_to include("never")
  end
end
