require 'amazon/ecs'
require 'pp'

Amazon.Ecs.options = {
  :associate_tag     => 'ASSOCIATE_TAG'
  :AWS_access_key_id => 'AWS_ACCESS_KEY'
  :AWS_secret_key    => 'AWS_SECRET_ACCESS_KEY'
}

#lookup_product
opts = {
  :country => 'jp',
  :author  => 'takagotch'
}
res = Amazon::Ecs.item_search('les-fleurs-du-mal', opts)
res.item.each do |item|
  puts item.get('ItemAttributes/Title')
end

#show_product_price
res = Amazon::Ecs.item_lookup(
  'XXXXXX', :response_group => 'Small',
  ItemAttributes, Images', :country => 'jp')
pp res
