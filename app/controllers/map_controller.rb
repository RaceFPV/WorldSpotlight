class MapController < ApplicationController
  require 'Scraper'
  
  def index
  end

  def show
    #get the country code and country name
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)
    
    #for weather
    client = YahooWeather::Client.new
    @weather = client.fetch_by_location(@country)
    
    #for background pic
    obj = FlickrScraper.new(URI::encode(@countryname.to_s))
    @image = obj.getImageUrl()
    
    #render the country info
    return render partial: 'show.js.erb'
  end

end
