require 'anemone'

#Anemone.crawl(url, opts) do |anemone|
#end
#
#Anemone.crawl("http://example.com", otps) do |anemone|
#end
#
#otps = {
#  :proxy_host => 'your_proxy_server',
#  :proxy_port => '8080'
#}
opts = {
  :proxy_hosts => 'http://your_userid:your_password@example-proxy.com',
  :proxy_port  => '8080',
  :user_agent  => 'my_frist_crawler'
  :delay       => 1
}

Anemone.crawl("http://example.com", opts) do |anemone|
end

