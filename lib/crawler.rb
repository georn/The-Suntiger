require 'open-uri'
require 'nokogiri'
require 'csv'
require_relative 'seed_data'

class Crawler
	attr_reader :seeds, :urls, :keywords, :text, :description

	def initialize(seeds)
		@seeds = seeds
	end

	def fetch_data
		@seeds.each do |seed|
			checked_seed = check_url_or_file(seed)

			urls = fetch_urls(checked_seed)
			keywords = fetch_metadata('keywords', checked_seed)
			description = fetch_metadata('description',checked_seed)
			text = fetch_paragraphs(checked_seed)
			
			seed_data = SeedData.new(urls, keywords, description, text)
			p seed_data
		end
	end

	def store_in_csv(seed)
		csv_row = CSV.open("seeddata.csv", "w") do |row|
			row << [@urls, @keywords, @description, @text]
		end
	end

	def fetch_urls(seed)
		urls = []
		seed_urls_nodeset = seed.xpath('//a')
		seed_urls_nodeset.each do |node|
			urls << node.first[1] if node.first[1].include?('http://')
		end
		return urls
	end

	def fetch_metadata(attribute, seed)
		meta_from_nodeset = seed.xpath('//meta')
		get_from_nodeset(attribute, meta_from_nodeset)
	end

		def fetch_paragraphs(seed)
		full_text = ""
		seed_paragraph_nodeset = seed.xpath('//p')
		seed_paragraph_nodeset.each do |node|
			raw_text = node.text.delete('^A-Za-z ')
			raw_text.gsub!(/[\n,\t]/, " ") if raw_text.include?('\n')
			full_text += "#{raw_text} "
		end
		return full_text.split.join(" ")
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

		def get_from_nodeset(attribute, nodeset)
		nodeset.each do |node|
			next unless node.attributes['name']
			output = node.attributes['content'].value
		 	output = output.split(/\s*,\s*/) if attribute == 'keywords'
			return output if node.attributes['name'].value == attribute
		end
	end
end

crawler = Crawler.new(['http://www.bbc.co.uk'])
crawler.fetch_data
