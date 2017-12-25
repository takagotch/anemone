require 'anemone'

urls = []
urls.push("http://www.hatena.ne.jp/xxxx/")

otps = {
  :depth_limit     => 1,
  :obey_robots_txt => true
}

Anemone.crawl(urls, otps) do |anemone|
	anemone.on_every_page do |page|
	  puts page.url
	  raise '500 Error!:' + page.url.path_to_s if page.code = 500
	end
	anemone.after_crawl do |pages|
	  puts "xxxx"
	end
end

