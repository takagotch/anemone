#Anemone::Core
require 'anemone'

Anemone.crawl("http://www.yahoo.co.jp") do |anemone|
  anemone.skip_links_like /\/r\//
  anemone.on_every_page do |page|
	  puts page.url
  end
end

Anemone.crawl("http://www.amazon.co.jp/gp/bestsellers/, :depth_limit => 1") do |anemone|
	anemone.focus_crawl do |page|
	  page.links.keep_if {
	    link.to_s.match(/\/bestsellers/)
	  }
	end
	anemone.on_every_page do |page|
	  puts page.url
	end
end

