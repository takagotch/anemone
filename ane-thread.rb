require 'aneone'

urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/xxxx")

opts = {
  :obey_robots_txt => true,
  :threads         => 10,
  :depth_limit     => 0
}

Aneone.crawl(urls, otps) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    puts page.doc.xpath("//title/text()").to_s if page.doc)
  end
end

