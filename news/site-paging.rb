class NewsSite
  attr_reader :base_url
  attr_reader :url

  def initailize(site)
    @site     = site
    @base_url = site.base_url
    @url      = site.url

    methods.each do |method|
      if !@site.respond_to?(method.to_sym)
        raise "Site adapter must support mehod #{mehod}"
      end
    end
  end

  def scrape(doc)
    @site.scrape(doc)
  end
  
  def get_next_url(doc)
    @site.get_next_url(doc)
  end
end

