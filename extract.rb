require 'extractcontent'
require 'open-uri'

html = open(
	'http://www.bloger.com/entry/20171229/xxxxxxxx').read
content, title = ExtractContent.analyse(html)
puts title
puts content

