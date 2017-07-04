require 'crawler.rb'

describe Crawler do

  seeds = [ 'file://' + __dir__ + '/test.html']
  let(:crawler) {Crawler.new(seeds)}

  it "It exist" do
    expect(crawler).to be_truthy
  end

  it "it initializes with the seeds" do
    expect(crawler.seeds).to eq(['file:///Users/geor/Documents/Code/MakersAcademy/Projects/week9/search_engine/spec/test.html'])
  end

  it "it fetches the urls in the domain site of each seeds" do
    expect(crawler.fetch_urls).to eq(['http://www.google.com', 'http://www.youtube.com', 'http://www.bbc.co.uk'])
  end
end
