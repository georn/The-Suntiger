require 'open-uri'
require 'nokogiri'

class Crawler
	attr_reader :seeds, :urls, :keywords

	def initialize(seeds)
		@seeds = seeds
	end

	def fetch_data
		@seeds.each do |seed|
			@urls = fetch_urls(seed)
			@keywords = fetch_keywords(seed)
		end
	end

	def fetch_urls(seed)
		urls = []
		checked_seed = check_url_or_file(seed)

		seed_urls_nodeset = checked_seed.xpath('//a')
		seed_urls_nodeset.each do |node|
			urls << node.first[1] if node.first[1].include?('http://')
		end
		return urls
	end

	def fetch_keywords(seed)
			checked_seed = check_url_or_file(seed)
			seed_keys_nodeset = checked_seed.xpath('//meta')
			get_keywords_from_nodeset(seed_keys_nodeset)
	end

	private

	def check_url_or_file(seed)
		if(seed.include? ('file://'))
			seed.slice!('file://')
			File.open(seed) { |f| Nokogiri::HTML(f)}
		else
			Nokogiri::HTML(open(seed))
		end
	end

	def get_keywords_from_nodeset(nodeset)
		nodeset.each do |node|
				next unless node.attributes['name']
					if node.attributes['name'].value == 'keywords'
						return keywords = node.attributes['content'].value.split(/\s*,\s*/)
				end
			end
	end
end

crawler = Crawler.new(['http://www.bbc.co.uk'])
crawler.fetch_data
puts crawler.urls
