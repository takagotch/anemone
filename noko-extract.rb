require 'open-uri'
require 'nokogiri'

html = open(
  'http"//www.bloger.com/entry/20171229/xxxxxxxxxx').read
doc = Nokogiri::HTML(html)
puts doc.xpath("//div[@class='entry-content']").text

