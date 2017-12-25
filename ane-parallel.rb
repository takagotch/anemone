require 'parallel'
require 'nokogiri'
require 'open-uri'

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

Parallel.each(urls, in_threads: 10){|url|
  doc = Nokogiri::HTML(open(url))
  puts doc.title
}

