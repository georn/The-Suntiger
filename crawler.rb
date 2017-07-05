require 'open-uri'
require 'nokogiri'

start = 'http://www.bbc.co.uk'

start_nokogiri = Nokogiri::HTML(open(start))

start_link_nodeset = start_nokogiri.xpath('//a')
start_head_nodeset = start_nokogiri.xpath('//meta')

links = [];
#texts = [];

start_link_nodeset.each do |node|
	links << node.first[1]
end

start_head_nodeset.each do |node|
	if node.first[0] == 'content'
		p node.first[1]
	end
end

