class MapController < ApplicationController
  def index
  end

  def show
    @country = params[:id]
    @countryname = Country.find_country_by_alpha2(@country)
    client = YahooWeather::Client.new
    @weather = client.fetch_by_location(@country)
    return render partial: 'show.js.erb'
  end

end
