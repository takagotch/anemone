require 'anemone'
require 'anemone'

urls = []
urls.push("http://www.yahoo.co.jp")

opts = {
  :depth_limit => 0
}

Anemone.crawl(urls, otps) do |anemone|
  pp caller()
  anemone.on_every_page do |page|
    puts page.rb
    puts page.doc.xpath("//title/text()").to_s if page.doc
  end
end

