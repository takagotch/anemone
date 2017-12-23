requiew 'anemone'

urls = [
  "http://www.amazon.co.jp/gp/bestsellers/books/",
  "http://www.amazon.co.jp/gp/bestsellers/digital.text/xxxxx/",]

Anemone.crawl(
  url,  :depth_limit => 1, :skip_query_strings => true)
do |anemone|

  anemone.focus_crawl do |page|
    page.links.keep_if { |link|
      link.to_s.match(
      /\/gp\/bestsellers\/nooks|\/gp\/bestsellers\/digital.text/)
    }
  end

  anemone.on_every_page do |page|
    puts page.url
  end
end

