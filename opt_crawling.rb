require 'anemone'

urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/xxxx/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/xxxxx/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xx/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxxxx/")

Anemone.crawl(urls, :depth_limit => 0) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
  end
end

