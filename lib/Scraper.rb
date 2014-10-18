require 'open-uri'
require 'nokogiri'
require 'json'

#Base class for all the scraping class
#TODO: Refactor
class Scraper
   attr_accessor :url

  def scrapeUrl(url)
  	doc = Nokogiri::HTML(open(url))
  	return doc
  end

  def scrapeObj(url)
  	doc = Nokogiri::XML(url)
  	return doc
  end
end

=begin

obj = FlickrScraper.new(CountryName)
obj.getImageUrl() <- it returns the url of the image at original size

=end

class FlickrScraper < Scraper
	attr_accessor :location

	def initialize(name)
		@location = name
	end

	def getImageUrl()
		string = ""
		response = open('https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=506ed830c6237fa6d09a78faf55611ff&privacy_filter=1&safe_search=1&content_type=1&tags='+location+'&per_page=100&page=1&extras=original_format&format=rest').read
		doc = scrapeObj(response)
		res = doc.xpath("//photo")
		res.each do |rs|
			id = rs[:id]
			puts "id is #{id}"
			sizeGET = open('https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=506ed830c6237fa6d09a78faf55611ff&&photo_id='+id+'&format=rest')
			docSize = scrapeObj(sizeGET)
			docSizePath = docSize.xpath("//size")
			puts docSizePath.count
			docSizePath.each do |dsp|
				if(dsp[:label] == 'Original')
					string = dsp[:source]
					puts "string is #{string}"
					return string
				end
			end
		end
	end
end


class NewsScraper < Scraper
	attr_accessor :location

	def initialize(name)
		@location = name
	end

	def getNews()
		doc = scrapeUrl("http://www.faroo.com/api?q=#{location}&start=1&length=3&l=en&src=news&f=xml&key=lBbetYupJAk2n8scJmiKTVDlNrw_")
		scrp = doc.xpath("//result")
		return scrp
    
	def getCapital()
		doc = scrapeUrl("http://en.wikipedia.org/wiki/"+location)
		#print(doc)
		doc.xpath("//Infobox") do |node|
			print(node)
		end
	end
end

#WIP
class WeatherScraper < Scraper
	attr_accessor :location

	def getCapitalWeather(location)
	end
end
end