class MapController < ApplicationController
  require 'Scraper'

  def index
  end

  def background
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)

    #for background pic
    obj = FlickrScraper.new(URI::encode(@countryname.to_s))
    @image = obj.getImageUrl()
    #render the background image
    return render partial: 'background.js.erb'
  end

  def news
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)
    #for news
    news = NewsScraper.new(URI::encode(@countryname.to_s))
    @page = news.getNews
    @title_count = @page.css("title").count
    #render the news panel
    return render partial: 'news.js.erb'
  end

  def twitter
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)
    #for twitter feed
    twitter = TwitterScraper.new(@countryname)
    @twitter = twitter.getTrends()
    #render the twitter panel
    return render partial: 'twitter.js.erb'
  end

  def glance
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)

    #for weather
    client = YahooWeather::Client.new
    @weather = client.fetch_by_location(@country)

    #for currency
    @currencyname = Country[@country].currency['name'] rescue nil
    @currencysymbol = Country[@country].currency['symbol'] rescue nil
    @currencycode = Country[@country].currency['code'] rescue nil
    Money::Bank::GoogleCurrency.ttl_in_seconds = 86400
    Money.default_bank = Money::Bank::GoogleCurrency.new
    if @currencycode
      @currencyconverted1 = Money.us_dollar(100).exchange_to(@currencycode)
    end
    #render the at a glance panel
    return render partial: 'glance.js.erb'
  end


  def countryname
    #get the country code and country name
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)

    #render the country name
    return render partial: 'countryname.js.erb'
  end

  def show
    #render the spinners
    return render partial: 'show.js.erb'
  end

  def youtube
    #get the country code and country name
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)

    #render youtube stuff
    return render partial: 'youtube.js.erb'
  end

end
