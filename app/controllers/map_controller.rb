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

    #for currency
    @currencyname = Country[@country].currency['name']
    @currencysymbol = Country[@country].currency['symbol']
    @currencycode = Country[@country].currency['code']
    Money::Bank::GoogleCurrency.ttl_in_seconds = 86400
    Money.default_bank = Money::Bank::GoogleCurrency.new
    @currencyconverted1 = Money.us_dollar(100).exchange_to(@currencycode)
    @currencyconverted10 = Money.us_dollar(1000).exchange_to(@currencycode)
    @currencyconverted100 = Money.us_dollar(10000).exchange_to(@currencycode)
    @currencyconverted1000 = Money.us_dollar(100000).exchange_to(@currencycode)
    
    #for seasons
    @countryregion = Country.find_country_by_alpha2(@country).region
    @countrysubregion = Country.find_country_by_alpha2(@country).subregion
    
    #for news
    # @newsarticle1 = news.getNews().first
    # @newsarticle1title = ActionController::Base.helpers.strip_tags(@newsarticle1.xpath("//title").first.to_s)
    # @newsarticle1time = ActionController::Base.helpers.strip_tags(@newsarticle1.xpath("//firstpublished").first.to_s)
    # @newsarticle1info = ActionController::Base.helpers.strip_tags(@newsarticle1.xpath("//kwic").first.to_s)
    # @newsarticle1link = ActionController::Base.helpers.strip_tags(@newsarticle1.xpath("//url").first.to_s)

      news = NewsScraper.new(URI::encode(@countryname.to_s))
      @page = news.getNews


    #render the country info
    return render partial: 'show.js.erb'
  end

end
