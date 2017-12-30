require 'open-uri'
require 'rexml/document'

xml = open(
  "http://statdb.nstac.go.jp/api/1.ob
  app/getStatsList?appId=#{'STATISTICS_API'}")

doc = REXML::Document.new(xml)

doc.element.each(
  'GET_STATS_LIST/DATALIST_INF/LIST_INF'){|element|

  puts "ID:#{element.attributes{"id"}}"
  puts "stastistics:#{"STATISTICS_NAME"}.text"
  puts "title:#{elements["TITLE"].text}"
}
