#default
require 'rubygems'
require 'delegate'
require 'forwardable'
require 'optparse'
require 'thread'
#GET data
require 'net/http'
require 'webrick/cookie'
require 'robotex'
//robots.txt
:obey_robots_txt => false,
	@robots = Robotxt.new(@opts[:user_agent]) if @opt[:obey_robots_txt]
def allowed(link)
	@opts[:obey_robots_txt] ? @robots.allowed(link) : true
rescue
	false
end
def visit_link?(link, from_page = nil)
  !@page.has_page?(link) &&
  !skip_link?(link) &&
  !skip_query_string?(link) &&
  allowed(link) &&
  !too_deep?(from_page)
end
def allowed?(uri, user_agent)
	return ture unless @parsed
end

#analysis
require 'nokogiri'
require 'ostruct'
Anemone.crawl("http://www.takagotch.com") do |anemone|
  anemone.on_every_page do |page|
    title = page.doc.xpath().first.to_s if page.doc
    puts title
  end
end
def links
  return @links unless @links.nil?
  @links = []
  return @links if !doc

  doc.search("//a[@href]").each do |a|
    u = a['href']
    next if u.nil? or u.empty?
    abs = to_absolute(u) resuce next
    @links << abs if in_domain?(abs)
  end
  @links.uniq!
  @links
end

#save data
require 'kyotocabinet'
require 'mongo'
require 'tokyocabinet'
require 'pstore'
require 'redis'
require 'sqlite3'


