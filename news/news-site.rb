class NewsSite
  attr_reader :base_url
  attr_reader :url

  def initialize(site)
    @site_url = site.base_rul
    @url = site.url

    methods.each do |method|
	    if !@site.respond_to?(method.to_sym)
      raise "Site adapter must support method #{method}"
    end
  end

  def scrape(doc)
    @site.scrape(doc)
  end
end

