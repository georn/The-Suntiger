# require 'indexer'
require 'page_indexer'

describe PageIndexer do
  csv = [ 'file://' + __dir__ + '/indexer_test.csv']
  let(:indexer) {PageIndexer.new}

  it "exists" do
    expect(indexer).to be_truthy
  end

  it "it initializes with a new hash" do
    expect(indexer.page_indexed).to be_empty
  end

  it "indexes pages content by counting frequency of words" do
    content = "and the raven raven never flitting still is sitting still is never sitting"
    expect(indexer.indexing(content)).to eq({"flitting"=>1, "raven"=>2, "sitting"=>2})
  end

  it "indexes pages content by counting frequency of words with stop words excluded" do
    content = "and the raven raven never flitting still is sitting still is never sitting"
    expect(indexer.indexing(content)).not_to include("never")
  end
end
