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
end