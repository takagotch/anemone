require 'open-uri'
require 'nokogiri'

html = open().read
doc = Nokogiri::HTML()
puts doc.xpath().text

