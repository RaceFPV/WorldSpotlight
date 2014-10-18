class MapController < ApplicationController
  def index
  end

  def show
    render partial: 'show.js.erb'
  end

end
