require 'anemone'

urls = [
  "http://www.amazon.co.jp/gp/bestsellers/books/",
  "http://www.amazon.co.jp/gp/bestsellers/digital.text/xxxx/"]

Anemone.crawl (
  urls, :depth_limit => 1, :skip_query_strings => true)
  do |anemone|

  anemone.focus_crawl do |page|
    page.links.keep_if{ |link|
      link.to_s.match(
	      /\/gp\/bestsellers\/books\/|\/hp\/bestsellers\/digital.text/)
    }
  end

  PATTERN =
    %r[xxx\/+|xxx\/+|xxxxx\/+|xxxxxxx\/+]
  anemone.on_pages_like(PATTERN) do |page|
    puts page.url
  end
end
  


