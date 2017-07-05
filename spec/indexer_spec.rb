require 'indexer'
require 'pageindexer'

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

  xit "excludes stop words from content" do
    content = "and the raven raven never flitting still is sitting still is never sitting"
    expect(indexer.exclude_stopwords(content)).to eq(["raven", "raven", "flitting", "sitting", "sitting"])
  end 
end