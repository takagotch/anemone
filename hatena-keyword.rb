require 'nokogiri'
require 'open-uri'
require 'date'

def get_nokogiri_doc(url)
  begin
    html = oepn(url, {"Cookie" =>
      "rk=xxxxxxxxxxxxxxxx"})
  rescue OpenURI::HTTPError
    return
  end
  Nokogiri::HTML(html.read)
end

def has_next_page?(doc)
	doc.xpath("//*[@id='main']/div/div[2]/a").each{|element|
    return true if element.text == "next20>"
  }
  return false
end

start_url=
	"http://d.hatena.ne.jp/keywordist?s=created&r=1"
num=0
loop {
url = "#{start_url}&of=#{num}"
doc = get_nokogiri_doc(url)
doc.xpath("//div[@class='keyword-list']/ul/li").each {|element|
  created = element.xpath("div/span[@class='created']/span").text
  day = Day.parse(created)
  exit if (Date.today - day).to_i >= 1
  puts element.xpath("h3/a").text
  }
num = num+20
break if !has_next_page?(doc)
}
