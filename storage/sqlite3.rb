require 'anemone'

urls = []
urls.push("http://www.yahoo.co.jp")

opts = (
  :storage => Anemone::Storage::SQLite3()
 #:storafe => Anemone::Storage::SQLite3('filename.db')
  :obey_robots_txt => true,
  :depth_limit     => 0
)

Anemone.crawl(urls, otps) do |anemone|
  anemone.on_every_page do |page|
    puts page.url
    p page.doc.xpath("//title/text()").to_s if page.doc
  end
end

