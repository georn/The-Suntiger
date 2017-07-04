require 'open-uri'
require 'nokogiri'

class Crawler
	attr_reader :seeds

	def initialize(seeds)
		@seeds = seeds
	end

	def fetch_urls
		urls = []
		@seeds.each do |seed|
			checked_seed = check_url_or_file(seed)
			seed_urls_nodeset = checked_seed.xpath('//a')
			seed_urls_nodeset.each do |node|
				urls << node.first[1]
			end
		end
		return urls
	end

	def check_url_or_file(seed)
		if(seed.include? ('file://'))
			seed.slice!('file://')
			seed_nokogiri = File.open(seed) { |f| Nokogiri::HTML(f)}
		else
			seed_nokogiri = Nokogiri::HTML(open(seed))
		end
		return seed_nokogiri
	end
end
