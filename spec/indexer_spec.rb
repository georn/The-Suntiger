require 'indexer'
require 'pageindexer'

describe PageIndexer do
  csv = [ 'file://' + __dir__ + '/indexer_test.csv']
  let(:indexer) {PageIndexer.new}

  it "exists" do
    expect(indexer).to be_truthy
  end
end