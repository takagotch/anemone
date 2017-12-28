require 'open-uri'
require 'rexml/document'

def get_xml_doc(url)
end

base_url=""
base_url=""
sitemaps = get_xml_doc()
sitemaps.elements.each() do |element|
	sitemap = get_xml_doc()
	sitemap.elements.each() do |element|
		if // =~ element.text
			puts element.text
		end
	end
end

