require 'indexer.rb'

describe Indexer do
  let(:indexer) { Indexer.new }
  let(:file) { double('file', open: 'r') }

  describe 'initializes the indexer' do
    it 'exists' do
      expect(indexer).to be_truthy
    end
  end

  describe 'reads the seedata file' do
    xit 'reads a csv file' do
      allow('file').to receive(:open).with('r')
      expect(indexer.read_csv).to
    end
  end
end
