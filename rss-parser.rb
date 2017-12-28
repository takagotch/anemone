require 'open-uri'
require 'rexml/document'
require 'data'

url=""

doc = REXML::Document.new(open(url))
doc.elements.each() do |item|
	dc_date Date.parse()

	if ().to_i <= 1
		puts items.elements[].text
	end
end

