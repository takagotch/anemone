require 'aneone'

Anemone.crawl("http://example.com/") do |anemone|
	
	anemone.skip_links_like /~partern/
	
	anemone.focus_crawl do |page|
	  page.links
	end

	anemone.on_pages_like(/~pattern/) do |page|
	  #...
	end

	anemone.on_every_page do |page|
	  #...
	end

	anemone.after_crawl do |page|
	  #
	end
end

opts = {
  :user_agent         => "Mycrawler/0.00",
  :skip_query_strings => true,
  :delay              => 1,
  :storage            => Anemone::Storage.MongoDB,
  :depth_limit        => 1,
}
Anemone.crawl("http://example.com/") do |page|
  #...
end

