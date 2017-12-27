require 'geocoder'

Geocoder.configure(:language =>
		  "ja", :units => "km")

addresses = Geocoder.search("559-0000",
			   :params => {:countorycodes => "ja"})
addresses.each {|address|
  address.data["short_name"].each {|value|
    if value["short_name"] == "JP"
	    lat = address.data
	    ["geometry"]["location"]["lat"]
	    lng = address.data
	    ["geometry"]["location"]["lng"]
	    puts "lat: #{lat}"
	    puts "lng: #{lng}"
    end
  }
}

