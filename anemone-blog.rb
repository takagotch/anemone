require 'anemone'
require 'open-uri'

urls = {"http://www.bloger.com/staff/"}
otps = {
  :depth_limit => false,
  :delay       => 1
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.focus_crawl do |page|
    page.links.keep_if {|link|
      link.to_s.match(/www.bloger.com\/staff/archives\/(\d.)\.html/)
    }
  end

  anemone.on_every_page do |page|
    puts page.url
  end
end

#http://www.bloger.com/staff/
#http://www.bloger.com/staff/archieves/xxxxx.html
#http://www.bloger.com/staff/archieves/cat_xxxxx.html
#http://www.bloger.com/staff/archives/YYYY-MM.html


