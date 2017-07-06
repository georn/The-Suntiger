require 'nokogiri'
require 'open-uri'
require 'crawler.rb'

describe Crawler do

  seeds = [ 'file://' + __dir__ + '/fake_page.html']
	sliced_seed = seeds[0].gsub('file://', '')

  let(:crawler) {Crawler.new(seeds)}
	let(:nokogiri_seed) { File.open(sliced_seed) { |f| Nokogiri::HTML(f) } }

	describe 'initializes the crawler' do
		it "exists" do
			expect(crawler).to be_truthy
		end

		it "initializes with the seeds" do
			expect(crawler.seeds).to eq(['file://' + __dir__ + '/fake_page.html'])
		end
	end

	describe 'fetches data' do
		it "fetches the urls in the domain site of each seeds" do
			expect(crawler.fetch_urls(nokogiri_seed)).to eq(['http://www.google.com', 'http://www.youtube.com', 'http://www.bbc.co.uk'])
		end

		it "fetches the keywords from the domain of each seed" do
			expect(crawler.fetch_metadata('keywords', nokogiri_seed)).to eq(['test', 'fake page', 'Search'])
		end

		it "fetches the description within a html meta tag" do
			expect(crawler.fetch_metadata('description', nokogiri_seed)).to eq("The best of the BBC, with the latest news and sport headlines, weather, TV & radio highlights and much more from across the whole of BBC Online")
		end

		it "fetches the text within html paragraph tags" do
			expect(crawler.fetch_paragraphs(nokogiri_seed)).to eq("Lorem ipsum dolor sit amet consectetur adipiscing elit Quisque et tortor elementum Nulla ullamcorper interdum nisl a fermentum metus suscipit at")
		end

		it "fetches the headers within a html document" do
			expect(crawler.fetch_headers(nokogiri_seed)).to eq(['Links', 'Text', 'Some other header'])
		end
	end
end
