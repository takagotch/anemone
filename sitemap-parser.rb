require 'open-uri'
require 'rexml/document'

def get_xml_doc(url)
	return REXML::Document.new(open(url))
end

base_url="http://www.bloger.com/sitemap.xml"
base_url="http://www.bloger.com/staff/sitemap.xml"
sitemaps = get_xml_doc(base_url)
sitemaps.elements.each('sitemapindex/sitemap/loc') do |element|
	sitemap = get_xml_doc(element.text)
	sitemap.elements.each('utlset/url/loc/') do |element|
		if /\/staff\/archives\/(\d)\.html/ =~ element.text
			puts element.text
		end
	end
end

