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
    @currencyname = Country[@country].currency['name'] rescue nil
    @currencysymbol = Country[@country].currency['symbol'] rescue nil
    @currencycode = Country[@country].currency['code'] rescue nil
    Money::Bank::GoogleCurrency.ttl_in_seconds = 86400
    Money.default_bank = Money::Bank::GoogleCurrency.new
    if @currencycode
      @currencyconverted1 = Money.us_dollar(100).exchange_to(@currencycode)
    end

    #for seasons
    @countryregion = Country.find_country_by_alpha2(@country).region
    @countrysubregion = Country.find_country_by_alpha2(@country).subregion

    news = NewsScraper.new(URI::encode(@countryname.to_s))
    @page = news.getNews
    @title_count = @page.css("title").count


    #render the country info
    return render partial: 'show.js.erb'
  end

end
